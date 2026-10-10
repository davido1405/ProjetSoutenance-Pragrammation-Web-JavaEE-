<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mes évaluations - Enseignant</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-[#F7F8F5]">
<div class="flex min-h-screen">
  <aside class="w-64 bg-[#1D2E22] text-[#DDE4D6] flex flex-col px-5 py-6 shrink-0">
    <div class="flex items-center gap-2 font-medium text-lg text-white mb-8">
      <span class="w-9 h-9 rounded-lg bg-[#E7EFC9] flex items-center justify-center"><svg class="w-5 h-5 text-[#1D2E22]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg></span>
      soutena.
    </div>
    <div class="flex items-center gap-3 pb-6 border-b border-[#2A3F31]">
      <span class="w-9 h-9 rounded-lg border border-[#3A5240] flex items-center justify-center"><svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="8" r="3"/><circle cx="17" cy="9" r="2.5"/><path d="M2 20c0-3 2.5-5 6-5s6 2 6 5M14 15.5c2.8.3 4.5 2 4.5 4.5"/></svg></span>
      <div><p class="text-sm text-white font-medium">Espace enseignant</p><p class="text-xs text-[#9FB89C]">Année académique 2024-2025</p></div>
    </div>
    <p class="text-xs tracking-widest uppercase text-[#7E9078] mt-6 mb-3">Mon espace personnel</p>
    <nav class="flex flex-col gap-1 text-sm">
      <a href="${pageContext.request.contextPath}/Encadrer?page=tableauDeBord" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Tableau de bord</a>
      <a href="${pageContext.request.contextPath}/Encadrer?page=mesSoutenances" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Mes soutenances</a>
      <a href="${pageContext.request.contextPath}/Encadrer?page=mesEvaluations" class="px-3 py-2.5 rounded-lg bg-[#2F5B45] text-white">Mes évaluations</a>
    </nav>
    <div class="mt-auto rounded-xl border border-[#3A5240] p-4 bg-[#24382B]">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-2">Session de juin 2025</p>
      <p class="text-white font-medium mb-1">Faites grandir les talents.</p>
      <p class="text-xs text-[#B9C2AF] mb-3">Chaque regard compte dans le parcours d'un étudiant.</p>
      <p class="text-xs text-[#D8E4A6] flex items-center gap-1.5"><span class="w-1.5 h-1.5 rounded-full bg-[#D8E4A6]"></span>Ensemble, vers la réussite</p>
    </div>
    <nav class="flex flex-col gap-1 text-sm mt-4">
      <a href="#" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Aide &amp; contact</a>
      <a href="${pageContext.request.contextPath}/logout" class="px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">Se déconnecter</a>
    </nav>
  </aside>
  <main class="flex-1">
    <div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace enseignant <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Mes évaluations</span></p>
      <span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-sm font-medium">${sessionScope.ConnectedUser.prenomuser.substring(0,1)}${sessionScope.ConnectedUser.nomuser.substring(0,1)}</span>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Accompagner, transmettre, évaluer</p>
      <h1 class="text-3xl font-medium text-[#2F3A2F] mb-8">Mes évaluations</h1>
      <div class="grid md:grid-cols-3 gap-5 mb-8">
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5"><p class="text-sm text-[#6E6D5F] mb-3">Mes convocations</p><p class="text-4xl font-medium mb-2">${convocations.size()}</p></div>
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5"><p class="text-sm text-[#6E6D5F] mb-3">À évaluer</p><p class="text-4xl font-medium mb-2">${nbAEvaluer}</p></div>
        <div class="bg-white rounded-xl border border-[#ECEEE6] p-5"><p class="text-sm text-[#6E6D5F] mb-3">Évaluations transmises</p><p class="text-4xl font-medium mb-2">${nbTransmises}</p></div>
      </div>
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6">
        <div class="flex items-center justify-between mb-1"><h3 class="text-lg font-medium">Mes évaluations</h3><form action="${pageContext.request.contextPath}/Encadrer" method="get" class="inline"><input type="hidden" name="page" value="mesEvaluations"><input name="q" value="${param.q}" placeholder="Rechercher un étudiant..." class="border border-[#E3E1D6] rounded-lg px-3 py-2 text-sm outline-none w-72"></form></div>
        <p class="text-sm text-[#9A9886] mb-5">Uniquement les soutenances pour lesquelles vous êtes membre du jury.</p>
        <div class="divide-y divide-[#F1F2EC]">
          <c:forEach var="s" items="${convocations}">
          <div class="flex items-center gap-4 py-4"><span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs">${s.prenometu.substring(0,1)}${s.nometu.substring(0,1)}</span><div class="flex-1"><p class="font-medium text-sm">${s.nometu} ${s.prenometu}</p><p class="text-xs text-[#9A9886]">${s.filierelib} · ${s.sujetetu}</p><p class="text-xs text-[#9A9886]">${s.jourSoutenance} à ${s.heureSoutenance} · ${s.sallesoutenance}</p><c:if test="${not empty s.avismembre}"><p class="text-xs text-[#9A9886] italic">"${s.avismembre}"</p></c:if></div>
            <c:choose>
              <c:when test="${not empty s.note}"><span class="bg-[#E6EEF5] text-[#4A6E8A] rounded-md px-2.5 py-1 text-xs">● Votre note : ${s.note}/20</span><a href="#" data-nom="${s.nometu}" data-prenom="${s.prenometu}" data-filiere="${s.filierelib}" data-sujet="${s.sujetetu}" data-progression="${s.progression}" data-notefinale="${s.noteFinaleJury}" data-note="${s.note}" data-avis="${s.avismembre}" onclick="document.getElementById('transEtudiant').textContent=(this.dataset.nom+' '+this.dataset.prenom+' · '+this.dataset.filiere);document.getElementById('transSujet').textContent=this.dataset.sujet;document.getElementById('transProgression').textContent=this.dataset.progression+' transmises';document.getElementById('voirNote2').textContent=this.dataset.note;document.getElementById('voirAvis2').textContent=this.dataset.avis;var nf=this.dataset.notefinale;document.getElementById('transNoteFinale').textContent=(nf&&nf.length)?('Votre évaluation a été transmise. Note finale du jury : '+nf+'/20.'):'Votre évaluation a été transmise. En attente des autres membres du jury.';openModal('modalEvalTransmise');return false;" class="border border-[#E3E1D6] rounded-lg px-4 py-2.5 text-sm">Voir mon évaluation →</a></c:when>
              <c:otherwise><span class="bg-[#F5E9DE] text-[#B07A45] rounded-md px-2.5 py-1 text-xs">● À évaluer</span><a href="#" data-nom="${s.nometu}" data-prenom="${s.prenometu}" data-filiere="${s.filierelib}" data-sujet="${s.sujetetu}" data-progression="${s.progression}" onclick="openModal('modalEval');document.getElementById('idSoutenance2').value=${s.idsoutenance};document.getElementById('evalEtudiant').textContent=(this.dataset.nom+' '+this.dataset.prenom+' · '+this.dataset.filiere);document.getElementById('evalSujet').textContent=this.dataset.sujet;document.getElementById('evalProgression').textContent=this.dataset.progression+' transmises';return false;" class="bg-[#2F5B45] text-white rounded-lg px-4 py-2.5 text-sm">Saisir mon évaluation →</a></c:otherwise>
            </c:choose></div>
          </c:forEach>
        </div>
      </div>
    </div>
  </main>
</div>

<!-- Modal : Saisir mon évaluation -->
<div id="modalEval" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <div class="flex items-start justify-between mb-6">
      <span class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center"><svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="9" r="5"/><path d="M8 13.5 6.5 21 12 18l5.5 3-1.5-7.5"/></svg></span>
      <button type="button" onclick="closeModal('modalEval')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <h2 class="text-2xl font-medium text-[#2F3A2F] mb-1">Mon évaluation</h2>
    <p id="evalEtudiant" class="text-sm text-[#6E6D5F] mb-6">—</p>
    <div class="bg-[#F7F9F0] rounded-xl p-4 mb-6">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-1">Sujet du mémoire</p>
      <p id="evalSujet" class="text-[#5B7A4A] font-medium">—</p>
    </div>
    <p class="text-sm text-[#5B7A4A] mb-6">Évaluations du jury <span id="evalProgression" class="float-right text-xs">—</span></p>
    <form action="${pageContext.request.contextPath}/Evaluation" method="post" class="flex flex-col gap-4">
      <input type="hidden" name="id_soutenance" id="idSoutenance2" value="">
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Votre note sur 20</label><input type="number" step="0.25" min="0" max="20" name="note" required placeholder="Ex. 16,5" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Votre appréciation</label><textarea name="avis" rows="4" placeholder="Qualité du travail, présentation, points forts..." class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm outline-none"></textarea></div>
      <label class="flex items-center gap-2 text-sm text-[#5B5A4E]"><input type="checkbox" required> Je confirme cette note et cette appréciation.</label>
      <div class="flex justify-end gap-3 mt-4 pt-5 border-t border-[#F1F2EC]">
        <button type="button" onclick="closeModal('modalEval')" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm">Annuler</button>
        <button type="submit" class="bg-[#2F5B45] text-white rounded-lg px-5 py-2.5 text-sm">✓ Transmettre mon évaluation</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal : Évaluation transmise -->
<div id="modalEvalTransmise" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <div class="flex items-start justify-between mb-6">
      <span class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center"><svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="9" r="5"/><path d="M8 13.5 6.5 21 12 18l5.5 3-1.5-7.5"/></svg></span>
      <button type="button" onclick="closeModal('modalEvalTransmise')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <h2 class="text-2xl font-medium text-[#2F3A2F] mb-1">Mon évaluation</h2>
    <p id="transEtudiant" class="text-sm text-[#6E6D5F] mb-6">—</p>
    <div class="bg-[#F7F9F0] rounded-xl p-4 mb-6">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-1">Sujet du mémoire</p>
      <p id="transSujet" class="text-[#5B7A4A] font-medium">—</p>
    </div>
    <p class="text-sm text-[#5B7A4A] mb-6">Évaluations du jury <span id="transProgression" class="float-right text-xs">—</span></p>
    <div class="bg-[#F7F9F0] rounded-xl p-5 flex items-center justify-between mb-6">
      <p class="text-sm text-[#5B7A4A]">Votre note</p>
      <p class="text-3xl font-medium text-[#5B7A4A]"><span id="voirNote2">—</span> <span class="text-sm text-[#9A9886]">/ 20</span></p>
    </div>
    <p class="text-sm font-medium text-[#5B7A4A] mb-2">Votre appréciation</p>
    <p id="voirAvis2" class="text-sm text-[#6E6D5F] mb-6">—</p>
    <p id="transNoteFinale" class="bg-[#E7EFDF] text-[#5B7A4A] rounded-lg px-4 py-3 text-xs">Votre évaluation a été transmise.</p>
  </div>
</div>

<script>
function openModal(id){var e=document.getElementById(id); if(e){e.classList.remove('hidden'); e.style.display='flex';}}
function closeModal(id){var e=document.getElementById(id); if(e){e.classList.add('hidden'); e.style.display='none';}}
</script>
</body>
</html>


