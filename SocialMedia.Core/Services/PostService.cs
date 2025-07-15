using SocialMedia.Core.Entities;
using SocialMedia.Core.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SocialMedia.Core.Services
{
  public class PostService : IPostService
  {
    private readonly IRepository<Post> _postRepository;
    public PostService(IRepository<Post> postrepository)
    {
      _postRepository = postrepository;
    }

    public async Task<bool> DeletePost(int id)
    {
      await _postRepository.Delete(id);
      return true;
    }

    public async Task<Post> GetPost(int id)
    {
      return await _postRepository.GetById(id);
    }

    public async Task<IEnumerable<Post>> GetPosts()
    {
      return await _postRepository.GetAll();
    }

    public async Task InsertPost(Post post)
    {
      await _postRepository.Add(post);
    }

    public async Task<bool> UpdatePost(Post post)
    {
      await _postRepository.Update(post);

      return true;
    }
  }
}
