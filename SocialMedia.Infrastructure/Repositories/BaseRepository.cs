﻿using Microsoft.EntityFrameworkCore;
using SocialMedia.Core.Entities;
using SocialMedia.Core.Interfaces;
using SocialMedia.Infrastructure.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SocialMedia.Infrastructure.Repositories
{
  public class BaseRepository<T> : IRepository<T> where T : BaseEntity
  {
    private readonly SocialMediaContext _context;

    protected readonly DbSet<T> _entities;

    public BaseRepository( SocialMediaContext context)
    {
      _context = context;
      _entities = context.Set<T>();
    }
    public void Add(T entity)
    {
      _entities.Add(entity);
      //await _context.SaveChangesAsync();
    }

    public async Task Delete(int id)
    {
      T entity = await GetById(id);
      _entities.Remove(entity);
      //_context.SaveChanges();
    }

    public IEnumerable<T> GetAll()
    {
      return _entities.AsEnumerable();
    }

    public async Task<T> GetById(int id)
    {
      return await _entities.FindAsync(id);
    }

    public void Update(T entity)
    {
      _entities.Update(entity);
      //await _context.SaveChangesAsync();
    }
  }
}
