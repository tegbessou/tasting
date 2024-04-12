<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Controller;

use App\BottleInventory\Application\Command\ReplaceBottlePictureCommand;
use App\BottleInventory\Domain\Exception\ReplaceBottlePictureBottleDoesntExistException;
use App\BottleInventory\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

final class ReplaceBottlePictureController extends AbstractController
{
    public function __construct(
        private readonly CommandBusInterface $commandBus,
    ) {
    }

    public function __invoke(Request $request): JsonResponse
    {
        $id = $request->attributes->get('id');

        Assert::uuid($id);
        Assert::picture($request->files->get('picture')->getClientOriginalName());

        try {
            $this->commandBus->dispatch(
                new ReplaceBottlePictureCommand(
                    $id,
                    $request->files->get('picture')->getPathname(),
                    $request->files->get('picture')->getClientOriginalName(),
                ),
            );
        } catch (ReplaceBottlePictureBottleDoesntExistException) {
            throw new NotFoundHttpException();
        } catch (UpdateBottleNotAuthorizeForThisUserException) {
            throw new AccessDeniedHttpException();
        }

        return $this->json(null, 204);
    }
}
