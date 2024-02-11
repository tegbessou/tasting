<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Symfony\Controller;

use App\Bottle\Application\Command\ReplaceBottlePictureCommand;
use App\Bottle\Application\Query\GetBottleQuery;
use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Exception\ReplaceBottlePictureBottleDoesntExistException;
use App\Bottle\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Application\Query\QueryBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

final class PostBottlePictureAction extends AbstractController
{
    public function __construct(
        private readonly QueryBusInterface $queryBus,
        private readonly CommandBusInterface $commandBus,
    ) {
    }

    public function __invoke(Request $request): ?Bottle
    {
        $id = $request->attributes->get('id');

        Assert::uuid($id);
        Assert::picture($request->files->get('picture')->getClientOriginalName());

        $bottle = $this->queryBus->ask(new GetBottleQuery($id));

        try {
            $this->commandBus->dispatch(
                new ReplaceBottlePictureCommand(
                    $bottle,
                    $request->files->get('picture')->getPathname(),
                    $request->files->get('picture')->getClientOriginalName(),
                ),
            );
        } catch (ReplaceBottlePictureBottleDoesntExistException) {
            throw new NotFoundHttpException();
        } catch (UpdateBottleNotAuthorizeForThisUserException) {
            throw new AccessDeniedHttpException();
        }
        // passer à la commande la bouteille + l'image
        // verifier que l'utilisateur est bien le propriétaire de la bouteille
        // verifier que la bouteille existe

        // throw exception 404 si la bouteille est null
        // throw exception 401 si la bouteille ne lui appartient pas

        // ajouter l'image à la bouteille
        // uploader l'image

        // sauvegarder

        // gérer les exceptions dans le controller

        return $bottle;
    }
}
