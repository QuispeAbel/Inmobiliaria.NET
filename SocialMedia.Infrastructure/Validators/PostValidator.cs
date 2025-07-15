using FluentValidation;
using SocialMedia.Core.DTOs;

namespace SocialMedia.Infrastructure.Validators
{
  public class PostValidator : AbstractValidator<PostDto>
  {
    public PostValidator()
    {
      RuleFor(post => post.Description)
        .NotNull();
    }
  }
}
