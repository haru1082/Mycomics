function setupBookshelfButtons() {
  document.querySelectorAll('.bookshelf-btn').forEach((btn) => {
    btn.addEventListener('click', async (event) => {
      const mangaId = event.target.closest('.manga').dataset.id;

      // APIに本棚追加リクエストを送信する
      const response = await fetch(`/mangas/${mangaId}/bookshelf`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        },
      });

      if (response.ok) {
        event.target.textContent = '本棚に追加済み';
      } else {
        alert('エラーが発生しました。');
      }
    });
  });
}

export { setupBookshelfButtons };