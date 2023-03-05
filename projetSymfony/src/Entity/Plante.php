<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\HttpFoundation\File\File;
use App\Repository\PlanteRepository;
use Doctrine\ORM\Mapping as ORM;

#[ApiResource]
#[ORM\Entity(repositoryClass: PlanteRepository::class)]
/**
 * @Vich\Uploadable
 */
class Plante
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $nom;

    #[ORM\Column(type: 'string', length: 2550)]
    private $description;

    #[ORM\ManyToOne(targetEntity: Categorie::class, inversedBy: 'plantes')]
    private $Categorie;

    #[ORM\Column(type: 'string', length: 255)]
    private $image;

    #[ORM\Column(type: 'string', length: 255)]
    private $image2;

    #[ORM\Column(type: 'datetime_immutable', nullable: true)]
    private $updatedAt;

    /**
     * @Vich\UploadableField(mapping="plante_images", fileNameProperty="image")
     */
    private $imageFile;

    /**
     * @Vich\UploadableField(mapping="plante_images", fileNameProperty="image2")
     */
    private $image2File;

    #[ORM\Column(type: 'boolean')]
    private $visible;

    #[ORM\Column(type: 'string', length: 255)]
    private $nomImage;

    #[ORM\Column(type: 'string', length: 255)]
    private $descImage;

    #[ORM\Column(type: 'string', length: 255)]
    private $descFlo;

    #[ORM\Column(type: 'string', length: 255)]
    private $descSymb;

    #[ORM\Column(type: 'string', length: 255)]
    private $descTaille;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getCategorie(): ?Categorie
    {
        return $this->Categorie;
    }

    public function setCategorie(?Categorie $Categorie): self
    {
        $this->Categorie = $Categorie;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string|null $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getImage2(): ?string
    {
        return $this->image2;
    }

    public function setImage2(string|null $image2): self
    {
        $this->image2 = $image2;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeImmutable $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }


    public function setImageFile(File $imageFile = null): void
    {
        $this->imageFile = $imageFile;

        if (null !== $imageFile) {
            // It is required that at least one field changes if you are using doctrine
            // otherwise the event listeners won't be called and the file is lost
            $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }


    public function setImage2File(File $image2File = null): void
    {
        $this->image2File = $image2File;

        if (null !== $image2File) {
            // It is required that at least one field changes if you are using doctrine
            // otherwise the event listeners won't be called and the file is lost
            $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getImage2File(): ?File
    {
        return $this->image2File;
    }

    public function getVisible(): ?bool
    {
        return $this->visible;
    }

    public function setVisible(bool $visible): self
    {
        $this->visible = $visible;

        return $this;
    }

    public function __toString() {
        return "$this->nom";
    }

    public function getNomImage(): ?string
    {
        return $this->nomImage;
    }

    public function setNomImage(string $nomImage): self
    {
        $this->nomImage = $nomImage;

        return $this;
    }

    public function getDescImage(): ?string
    {
        return $this->descImage;
    }

    public function setDescImage(string $descImage): self
    {
        $this->descImage = $descImage;

        return $this;
    }

    public function getDescFlo(): ?string
    {
        return $this->descFlo;
    }

    public function setDescFlo(string $descFlo): self
    {
        $this->descFlo = $descFlo;

        return $this;
    }

    public function getDescSymb(): ?string
    {
        return $this->descSymb;
    }

    public function setDescSymb(string $descSymb): self
    {
        $this->descSymb = $descSymb;

        return $this;
    }

    public function getDescTaille(): ?string
    {
        return $this->descTaille;
    }

    public function setDescTaille(string $descTaille): self
    {
        $this->descTaille = $descTaille;

        return $this;
    }

}
