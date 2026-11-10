from sqlmodel import SQLModel, Field
from sqlalchemy.dialects.postgresql import JSONB

class Game(SQLModel, table=True):
    __tablename__ = "games"
    id: int = Field(default=None, primary_key=True)
    table_values: list[list[int]] = Field(
        default_factory=list,
        sa_type=JSONB,
    )