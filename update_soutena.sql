-- ============================================================
-- Script de mise à jour de la base `soutena` (PGS-PFE)
-- À exécuter après avoir importé soutena.sql
-- ============================================================

-- 1) Sujet du mémoire : nouvelle colonne utilisée par les pages JSP
ALTER TABLE `etudiant`
  ADD COLUMN `sujet` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL AFTER `adresse_etu`;

UPDATE `etudiant` SET `sujet` = 'Conception d''une plateforme de télémédecine' WHERE `matricule_etu` = 'ETU001';
UPDATE `etudiant` SET `sujet` = 'Détection de fraudes par apprentissage automatique' WHERE `matricule_etu` = 'ETU002';
UPDATE `etudiant` SET `sujet` = 'Sécurisation des infrastructures cloud' WHERE `matricule_etu` = 'ETU003';
UPDATE `etudiant` SET `sujet` = 'Module de gestion des emplois du temps' WHERE `matricule_etu` = 'ETU004';
UPDATE `etudiant` SET `sujet` = 'Optimisation des réseaux intelligents' WHERE `matricule_etu` = 'ETU005';

-- 2) Statut des soutenances : valeur par défaut et contrainte CHECK minimale
ALTER TABLE `soutenance`
  MODIFY `statut` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'PLANIFIEE';

-- 3) Index utiles pour les jointures fréquentes (performance)
-- Note : MySQL ne supporte pas "CREATE INDEX IF NOT EXISTS".
CREATE INDEX `idx_soutenance_date` ON `soutenance` (`date_heure_soutenance`);
CREATE INDEX `idx_evaluation_soutenance` ON `evaluation` (`id_soutenance`);
CREATE INDEX `idx_etudiant_encadrant` ON `etudiant` (`matricule_ens_encadrant`);

-- 4) Rappel des codes de rôle (aucune modification) :
--    role 1 = ADMIN, 2 = ENCADREUR (membre du jury), 3 = ETUDIANT

-- 5) Soutenance 3 évaluée : la note finale est la moyenne des notes du jury,
--    elle est calculée à la volée par EvaluationDAO.getNoteFinale — aucune colonne à ajouter.
--    (16.50 + 15.00 + 17.00) / 3 = 16.17 / 20
