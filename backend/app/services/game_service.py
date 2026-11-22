from app.repositories.game_repository import GameRepository


class GameService:
    def __init__(self, repo: GameRepository):
        self.repo = repo

    def start_new_game(self):
        self.repo.start_new_game()

    def get_all_games(self):
        return self.repo.get_all_games()

    def get_game_by_id(self, id):
        return self.repo.get_game_by_id(id)

    def get_avaiable_fields(self, id):
        return self.repo.get_avaiable_fields(id)


