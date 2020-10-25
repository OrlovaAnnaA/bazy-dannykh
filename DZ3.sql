/* Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/

USE vk;
DROP TABLE IF EXISTS audios;
CREATE TABLE audios(
	id SERIAL,
	singer VARCHAR (50),
	song VARCHAR (50),
	song_stile ENUM('pop', 'rock', 'folk', 'classic')
);
DROP TABLE IF EXISTS user_audios;
CREATE TABLE user_audios(
	user_id BIGINT UNSIGNED NOT NULL,
	audio_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (audio_id) REFERENCES audios(id)
);
DROP TABLE IF EXISTS games;
CREATE TABLE games(
	id SERIAL,
	game_name VARCHAR (50)
);
DROP TABLE IF EXISTS user_games;
CREATE TABLE user_games(
	user_id BIGINT UNSIGNED NOT NULL,
	game_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);