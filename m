Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793722886;
	b=k6RW4wqz1kI1P7gpaTTO6scZi0LAUd1qS4vuP9wVicqLhHQhq2TvP+lFtZZnKaRxcsqN
	 zEWYoRfAT6cl1TmKl7A3AIlCtX2glG+wSeez8HUkfzxen53qEbaOkCvqY0F50wsdqNIHt
	 YAeqGoZ86rEuVCLStm/O1LzlPQZLr+xLYE0EjYcQwiz/7CWdnlCpwvrEBOFf+uxwjwi2q
	 YfU1dUnzFDOvucfI96eg+X74OnGfNjFCVGwqC7wPN3b8+flL0pOskyMbyb7HUdhebv+5L
	 RS6PnMiIcGQpxDpRlCrohhJOrUUZCafnJj1pdHMkINl/0xlGYGq9+QuaRkjHTrUS56Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722886;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DwhDVbhcBUSEtEbHxeGALtz6yeZcYK5jjpTuA0Uqmu4=;
	b=VdmhbDAxvAgFWboJpOygWjAvbNhWiPH+pEJUSmLyD811h7//udGiYlLK6j9AdrSEvcdu
	 yX9Tls93cpf6w54u+uMJ5+1i19w6dcJMWGGbvNmNmrJZu5l3+8z5gaFnzKuQgxQ+em5gi
	 Mpkr9WCeFVFGoHH/hSnT8HHDhD/yAj3Gdk94dKAVCtmUyKXmOinXpYLcBhK8NRqswH3le
	 iqdV9oMIUsvBW6v8/06diGk7eYwh8AgNgBxzYeKWqiYgjntsaXUk6bTuFSZtMftZELBDU
	 De2kW3l6AcCf2YBGF7EAovxJCalFHZ/Sm3k8TEv6CBvtLuI+a0e6NGlibu8hEGbI0qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAj28Xkv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F728606A329
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAj28Xkv
Received: by smtp.kernel.org (Postfix)
	id D54DC1F00A1E; Tue,  3 Nov 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793722885;
	b=Mmcip1oLKn+Z6DFEg1Vi28FIh/Nf5QXqSEduQC2UvFYbz38stmd0kX1jg7+hrWU1CmU3
	 iQgUjtbEqQKOudAEvF5KBLIfYyOCQ0Hq7pEEAnwKVUcIsa9H8n0j9AH1Qho52BKbkg7bx
	 P7JN/2VLxwo2sQEQXmDhsOvoDu4wSUe6adETwI4B19INnQr8Vw5CCHRxHJdpfnAD8TO4i
	 B6L2Jfd27FhUkXeHeI3VN23AeDmO9PmysVyYK2IQA3/oAVfBEVPevbFsazy+7Nolx2WLG
	 aUvdTDPyb3eMmHXzGaeZmLtv+AAfLN6rtZKHc9a8GuXV9OLUo7H7Mk4KJ9bC/BY58AA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793722885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=DwhDVbhcBUSEtEbHxeGALtz6yeZcYK5jjpTuA0Uqmu4=;
	b=ZMSmkhrSjGsof6+foF1qWgVShbRKTigkYwucFUVSk/TVSluTu3wwoVtLr2QpwtNgK9LM
	 6MTO79XHcxuvSycM4hS7625+t2i3KwKUykrjZ0gE40DfMIdYiDRFgo5FOQE5pn8OY32XM
	 49fxJQ7ZXZ4AnTyPqpZqMHTbpEV7uo1L2qNLVcuzNHhRWLjok7dJhMKyvix6cVu4jdLL7
	 ijtYhs3qLZ1vfp6RQTo7R4L/XmnOuJfWno9DW9D9QKVbO7c+//3SR6q2Hs8mjcN5ao1ah
	 kYWuuizwFLWT+PKt1W1ODBM3k7mkdnVcFMfseFjHUz28Vdj9vgPSWDRv6ahJCxzDBow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAj28Xkv;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 206EA1F00A1D
	for <tools@kernel.org>; Tue,  3 Nov 2026 16:21:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAj28Xkv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 206EA1F00A1D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so30383955e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 08:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793722882; x=1794327682; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwhDVbhcBUSEtEbHxeGALtz6yeZcYK5jjpTuA0Uqmu4=;
        b=xAj28XkvgOADNU49+tlrnlLgWX3AVSTcUlUJSn6TbhKnSNvbRDxCVjs+1phbBu2PFN
         nNqGxMz3g2fvjKCtrcq2ZM466zPVIjK3BooYmciLb6WNZPDAjBdfFL2+d922pm4pfBnF
         k282tgtryb3V81RvdEyNH1JrHZkvlrqXfndxp6Ov9zu8xFKbNs1koHbUUagJsCf0tO4A
         tJOM9og06ZSBWG95p+0JbFyLbTSlXbQl/E9H6CFteeqEGPerBOhMe+JagEhfoIWsRMt9
         vSR5VcM8QjztpiAgGOh7oZq4/omOXrGOjJuYjxhI5NLl5N89R5rQo765dtgwkjAB8Ioa
         fdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722882; x=1794327682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwhDVbhcBUSEtEbHxeGALtz6yeZcYK5jjpTuA0Uqmu4=;
        b=jbH3mjlJRLlh4pb7uj0EA1NSRFTNJ7Qnz5uaDl4kMzMxNKdwOJuK1s+5fTt+u4NCb4
         LZF5+NtNx+j7JWbUVBqKQWFDOAfz6VRJGML07VOuAUtj92nAG09lZqFWHh2bkVAXEcd2
         tmB3mJUWQvO4plluOTy0mNuyn3vqSrOIbM/eskbORD0yE7Ud1URO49Uf8/dTHS3HdtHn
         usrDozO4awdgtc9mX8SuCfjzDteWo5l4Yite8117+tqjxsu0zJ7Vu440cC1ZM4rVn/hE
         mwG4ng/yZVLAmzK9o720SP+7XfFAiW6eE/Pg/gB9G5BZS//xjG0GiZdMc/Qi9bV1NFE0
         cB0A==
X-Gm-Message-State: APuU4Z+oiDVpQ27LVvefoYNX5P61H++O8MhTcrDK317/+br0g8Uhwei6
	hInkjzHl9kJ6AXxFIwdhmawnLOe295E9QEYDEwWX0sdvozrewHaCeurt
X-Gm-Gg: AYBFou1u7tJGKac3D2jnV0PtIdUlOIiGBv+fXkE+QwF+Jo1vQJVootE/4XAzX0yb5Zi
	ys3EnQKf43X2WxNS+oq+kOedu6QBjb4lYg4rqCPnwxHTVy8VHLXRpzI8Uqdk+A9dK1SyHixP3r5
	8LtoD63yLNIT8MgmSDfLWGRiEqcPD3gNdqpoMl+1PHFsC2okirgRfxr+5FQqnUSV2W0WOzFZz8G
	n90bIlSYOY5eAxVLtnntOUxXuYnSok7MeduCZE10csFm0Fw9wR9ojJgxsM/BLZT/gPUkn8b1Y6i
	29RaM3Wh9fYe+WB+6f9ejvJ+HkCkSHY+eWeGq1/U04zpFx81gSC0AsHaU1Dc2dDpOq7v4mswM3f
	/vLNSAhIQ/kESxKFoycrieWek4jJUwrJBUjQTrl9RUOxZMhTKdyCPI1TR4TmY6NgmTB3LZtDdAD
	hoUr0I8hKNR1OJQfS/Q6zYszebafklXLej6488Ap1Yz2QgA6M6mX/Vch5UehbFIok+4BO/fZ3su
	wEf0HQB2IxnPFnMuoQyix7eVbq3e2VO7ax7CrqZHR+AoQZ3dQHek8d4ncVtREeFEhkhEKF8IUkU
	LM2dVvgVfHfpp1XPxiTZCM6V0QzHW1M=
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr313158985e9.24.1793722882366;
        Tue, 03 Nov 2026 08:21:22 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa481a45sm63661075e9.7.2026.11.03.08.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:21:21 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 17:20:35 +0100
Subject: [PATCH b4 3/3] review: allow configuring the upstream merge check
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-detect-merged-v1-3-743a882c6127@gmail.com>
References: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
In-Reply-To: <20261103-detect-merged-v1-0-743a882c6127@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793722874; l=17496;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=ngBu0bvtK78Wo5bH6FqdSzUKWyaLljkyvGwaDvk7XkU=;
 b=pukJTdqO31+9XMtGEDwKLrIe5I4q8LUiPrVO3Mcyp/RM6Gcy0Oe+Vyddk6gljXHyKV6rvkQjl
 z4UNFT5hclkDF0shk82vPdLvM0LkK9gQLbW9xGHdM/gy9D/sWH+zZXK
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Allow selecting an upstream repository and branch when automatic
discovery does not select the desired source. Pass the settings
through the review TUI and document their defaults.

Assisted-by: LLM [codegen, tests]
Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 docs/config.rst                    | 31 +++++++++++++++++++
 docs/maintainer/review.rst         |  4 +++
 src/b4/__init__.py                 |  3 ++
 src/b4/review/_review.py           | 29 ++++++++++++++----
 src/b4/review_tui/_modals.py       |  6 ++++
 src/b4/review_tui/_tracking_app.py |  8 +++++
 src/tests/test___init__.py         | 19 ++++++++++++
 src/tests/test_review.py           | 62 +++++++++++++++++++++++++++++++++-----
 8 files changed, 149 insertions(+), 13 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 593129e..7c36ffe 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -52,6 +52,8 @@ unrestricted:
 - ``*template*`` -- message templates
 - ``trailer*`` -- trailer-handling options
 - ``pw-*`` -- Patchwork integration options
+- ``upstream-repo`` -- the repository used to check merged patches during
+  an explicit review update
 
 The ``prep`` check and recipient-discovery commands are allowed because
 they only run when you explicitly invoke a check or ``--auto-to-cc`` on a
@@ -749,6 +751,35 @@ These settings control ``b4 review`` TUI behaviour.
 .. glossary::
    :sorted:
 
+   :term:`b4.upstream-repo`
+     Repository scanned for merged patches when ``b4 review`` updates a
+     tracked submission using ``u`` or ``U``. Specify a Git remote name
+     or a repository URL. Without this setting, b4 uses the ``upstream``
+     remote, or discovers the parent of a GitHub ``origin``.
+    Set it to ``none`` to disable upstream merge checks.
+
+     The branch selected by :term:`b4.upstream-branch` is fetched into a
+     private ref, with history starting one year before the oldest selected
+     series. Existing Git remotes are not added or modified.
+
+     A failed lookup or fetch leaves the last recorded merge indicators
+     unchanged.
+
+     Default: ``None``
+
+     .. versionadded:: v0.17
+
+   :term:`b4.upstream-branch`
+     Branch checked for upstream commits during review updates. Use
+     ``staging`` to detect patches accepted into an upstream staging branch.
+    When unset, b4 checks the selected repository for ``staging``,
+    then ``main``, then ``master``. If none exists, b4 fetches the
+    remote's ``HEAD``, which normally points to its default branch.
+
+     Default: ``None``
+
+     .. versionadded:: v0.17
+
    :term:`b4.review-default-take-method`
      The default take method to pre-select in the Take dialog. Valid
      values are ``merge``, ``linear``, and ``cherry-pick``. If not set,
diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 6070aa0..dd645e0 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -912,6 +912,10 @@ B4 uses an ``upstream`` remote or discovers the parent of a GitHub
 falling back to the remote's ``HEAD`` (normally its default branch). A
 failed lookup or fetch leaves the previous indicators unchanged.
 
+Set :term:`b4.upstream-repo` to choose a different repository, or to
+``none`` to disable upstream merge checks. Set :term:`b4.upstream-branch`
+to select a branch explicitly.
+
 Upgrading itself is always an explicit action: open the action menu
 (``a``) and select **Upgrade**. Availability depends only on a newer
 revision being known — the series can be in reviewing, replied,
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 79bb209..6f82633 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -312,6 +312,8 @@ SCRATCH_GIT_OPTS: List[str] = [
 DEFAULT_CONFIG: ConfigDictT = {
     'midmask': LOREADDR + '/all/%s',
     'linkmask': LINKADDR + '/%s',
+    'upstream-repo': None,
+    'upstream-branch': None,
     # You can override the format for the Link: trailer, e.g.
     # if you would rather use the Message-Id trailer. It takes the
     # message-id as the expansion for %s
@@ -5006,6 +5008,7 @@ def _setup_main_config(
         '*template*',
         'trailer*',
         'pw-*',
+        'upstream-*',
     ]
     multivals = [
         'keyringsrc',
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 4cf4174..3cf2c61 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -3000,8 +3000,17 @@ def _get_update_lock_path(identifier: str) -> str:
     return os.path.join(reviewdir, f'{identifier}.update.lock')
 
 
-def _resolve_upstream_repository(topdir: str) -> str:
+def _resolve_upstream_repository(topdir: str, configured: Optional[str]) -> str:
     """Resolve an upstream URL, remote name, or GitHub origin's parent URL."""
+    if configured:
+        remotes = b4.git_get_command_lines(topdir, ['remote'])
+        if configured in remotes:
+            ecode, url = b4.git_run_command(topdir, ['remote', 'get-url', configured])
+            if ecode != 0:
+                raise RuntimeError(f'Could not resolve remote {configured}')
+            return url.strip()
+        return configured
+
     remotes = b4.git_get_command_lines(topdir, ['remote'])
     if 'upstream' in remotes:
         ecode, url = b4.git_run_command(topdir, ['remote', 'get-url', 'upstream'])
@@ -3009,7 +3018,7 @@ def _resolve_upstream_repository(topdir: str) -> str:
             return url.strip()
 
     if 'origin' not in remotes:
-        raise RuntimeError('No upstream remote or origin remote')
+        raise RuntimeError('No upstream-repo config, upstream remote, or origin remote')
     ecode, origin = b4.git_run_command(topdir, ['remote', 'get-url', 'origin'])
     if ecode != 0:
         raise RuntimeError('Could not resolve origin remote')
@@ -3031,8 +3040,13 @@ def _resolve_upstream_repository(topdir: str) -> str:
     return f'https://github.com/{parent}.git'
 
 
-def _resolve_upstream_branch(topdir: str, repository: str) -> str:
+def _resolve_upstream_branch(
+    topdir: str, repository: str, configured: Optional[str]
+) -> str:
     """Resolve the branch to scan in the selected upstream repository."""
+    if configured:
+        return configured
+
     ecode, output = b4.git_run_command(
         topdir,
         ['ls-remote', '--heads', repository, 'staging', 'main', 'master'],
@@ -3099,6 +3113,8 @@ def update_all_tracking(
     series_list: Optional[List[Dict[str, Any]]] = None,
     progress_cb: Optional[Callable[[int, int, str], None]] = None,
     cancel_cb: Optional[Callable[[], bool]] = None,
+    upstream_repo: Optional[str] = None,
+    upstream_branch: Optional[str] = None,
 ) -> Dict[str, Any]:
     """Rescan branches, then fetch threads and update all tracked series.
 
@@ -3152,10 +3168,11 @@ def update_all_tracking(
             ]
 
         upstream_commits: Optional[Dict[str, List[UpstreamCommit]]] = None
-        if topdir and series_list:
+        upstream_disabled = upstream_repo and upstream_repo.strip().lower() == 'none'
+        if topdir and series_list and not upstream_disabled:
             try:
-                repository = _resolve_upstream_repository(topdir)
-                branch = _resolve_upstream_branch(topdir, repository)
+                repository = _resolve_upstream_repository(topdir, upstream_repo)
+                branch = _resolve_upstream_branch(topdir, repository, upstream_branch)
                 oldest_sent = min(
                     datetime.date.fromisoformat(
                         str(series.get('sent_at') or '1970-01-01')[:10]
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 32eccad..77bb5ad 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -3843,12 +3843,16 @@ class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
         identifier: str,
         linkmask: str,
         topdir: Optional[str] = None,
+        upstream_repo: Optional[str] = None,
+        upstream_branch: Optional[str] = None,
     ) -> None:
         super().__init__()
         self._series_list = series_list
         self._identifier = identifier
         self._linkmask = linkmask
         self._topdir = topdir
+        self._upstream_repo = upstream_repo
+        self._upstream_branch = upstream_branch
         self._cancelled = False
         self._result: Dict[str, Any] = {
             'series_checked': 0,
@@ -3897,6 +3901,8 @@ class UpdateAllScreen(ModalScreen[Dict[str, Any]]):
                     series_list=self._series_list,
                     progress_cb=_on_progress,
                     cancel_cb=_should_cancel,
+                    upstream_repo=self._upstream_repo,
+                    upstream_branch=self._upstream_branch,
                 )
             except b4.LockHeldError:
                 self._result['busy'] = True
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index df8f08d..7b0e4d6 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -2715,6 +2715,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         config = b4.get_main_config()
         linkmask = str(config.get('linkmask', 'https://lore.kernel.org/r/%s'))
+        upstream_repo = config.get('upstream-repo')
+        upstream_branch = config.get('upstream-branch')
         topdir = b4.git_get_toplevel()
 
         self._focus_change_id = self._selected_series.get('change_id')
@@ -2724,6 +2726,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 self._identifier,
                 linkmask,
                 topdir,
+                str(upstream_repo) if upstream_repo else None,
+                str(upstream_branch) if upstream_branch else None,
             ),
             callback=self._on_update_complete,
         )
@@ -2736,6 +2740,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
         config = b4.get_main_config()
         linkmask = str(config.get('linkmask', 'https://lore.kernel.org/r/%s'))
+        upstream_repo = config.get('upstream-repo')
+        upstream_branch = config.get('upstream-branch')
         topdir = b4.git_get_toplevel()
 
         # Skip snoozed series during update-all
@@ -2749,6 +2755,8 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
                 self._identifier,
                 linkmask,
                 topdir,
+                str(upstream_repo) if upstream_repo else None,
+                str(upstream_branch) if upstream_branch else None,
             ),
             callback=self._on_update_complete,
         )
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 5bf5cf6..43c9e48 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1830,6 +1830,25 @@ class TestDeprecatedConfig:
         assert 'searchmask' not in caplog.text
 
 
+class TestProjectUpstreamConfig:
+    def test_upstream_repo_is_allowed_from_project_config(self, gitdir: str) -> None:
+        wtcfg = pathlib.Path(gitdir) / '.b4-config'
+        wtcfg.write_text(
+            '[b4]\n'
+            '  upstream-repo = https://github.com/xen-project/xen.git\n'
+            '  upstream-branch = staging\n'
+            '  untrusted-option = ignored\n'
+        )
+
+        b4._setup_main_config(topdir=gitdir)
+
+        assert b4.get_main_config()['upstream-repo'] == (
+            'https://github.com/xen-project/xen.git'
+        )
+        assert b4.get_main_config()['upstream-branch'] == 'staging'
+        assert 'untrusted-option' not in b4.get_main_config()
+
+
 class _FakeClock:
     """Stands in for the time module inside dns.resolver."""
 
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index ce658c2..871332a 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -4636,6 +4636,8 @@ def test_update_all_tracking_fetches_upstream_once(
         'https://lore.example/r/%s',
         topdir='/repo',
         series_list=series,
+        upstream_repo='configured-upstream',
+        upstream_branch='staging',
     )
 
     fetch.assert_called_once_with('/repo', 'repo', '2025-03-01', 'staging')
@@ -4659,7 +4661,20 @@ def test_resolve_upstream_branch_prefers_available_branch(
             gitdir, ['update-ref', f'refs/heads/{branch}', 'HEAD']
         )
         assert ecode == 0
-    assert _review._resolve_upstream_branch(gitdir, gitdir) == expected
+    assert _review._resolve_upstream_branch(gitdir, gitdir, None) == expected
+
+
+def test_resolve_upstream_branch_falls_back_to_remote_head(
+    gitdir: str, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    git = mock.Mock(return_value=(0, ''))
+    monkeypatch.setattr(b4, 'git_run_command', git)
+    assert _review._resolve_upstream_branch(gitdir, 'selected-repo', None) == 'HEAD'
+    git.assert_called_once_with(
+        gitdir,
+        ['ls-remote', '--heads', 'selected-repo', 'staging', 'main', 'master'],
+        logstderr=True,
+    )
 
 
 def test_upstream_head_fetches_remote_default_branch(gitdir: str) -> None:
@@ -4671,18 +4686,39 @@ def test_upstream_head_fetches_remote_default_branch(gitdir: str) -> None:
     assert ecode == 0
     for branch in ('staging', 'main', 'master'):
         b4.git_run_command(gitdir, ['update-ref', '-d', f'refs/heads/{branch}'])
-    branch = _review._resolve_upstream_branch(gitdir, gitdir)
+    branch = _review._resolve_upstream_branch(gitdir, gitdir, None)
     assert branch == 'HEAD'
     assert _review._fetch_upstream_commits(gitdir, gitdir, '1970-01-01', branch)
 
 
-def test_resolve_upstream_branch_reports_lookup_failure(
+def test_resolve_upstream_branch_explicit_and_failed_lookup(
     gitdir: str, monkeypatch: pytest.MonkeyPatch
 ) -> None:
     git = mock.Mock(return_value=(1, 'repository unavailable'))
     monkeypatch.setattr(b4, 'git_run_command', git)
+    assert _review._resolve_upstream_branch(gitdir, 'selected-repo', 'next') == 'next'
+    git.assert_not_called()
     with pytest.raises(RuntimeError, match='repository unavailable'):
-        _review._resolve_upstream_branch(gitdir, 'selected-repo')
+        _review._resolve_upstream_branch(gitdir, 'selected-repo', None)
+
+
+def test_update_all_tracking_can_disable_upstream_check(
+    monkeypatch: pytest.MonkeyPatch,
+) -> None:
+    monkeypatch.setattr(b4.review.tracking, 'rescan_branches', lambda *args: {})
+    resolve = mock.Mock(side_effect=AssertionError('unexpected upstream lookup'))
+    monkeypatch.setattr(_review, '_resolve_upstream_repository', resolve)
+    monkeypatch.setattr(review, 'update_series_tracking', lambda *args, **kwargs: {})
+    result = review.update_all_tracking(
+        'upstream-disabled',
+        'https://example.com/%s',
+        topdir='/repo',
+        series_list=[{'change_id': 'a', 'subject': 'a'}],
+        upstream_repo='None',
+    )
+    resolve.assert_not_called()
+    assert result['upstream_merge_error'] is None
+    assert result['series_checked'] == 1
 
 
 def test_update_all_tracking_continues_when_upstream_fetch_fails(
@@ -4725,12 +4761,24 @@ def test_update_all_tracking_continues_when_upstream_fetch_fails(
     assert result['series_checked'] == 1
 
 
+def test_resolve_upstream_repository_prefers_configured_remote(gitdir: str) -> None:
+    remote_url = 'https://example.com/project/upstream.git'
+    ecode, _out = b4.git_run_command(
+        gitdir, ['remote', 'add', 'project-upstream', remote_url]
+    )
+    assert ecode == 0
+
+    assert (
+        _review._resolve_upstream_repository(gitdir, 'project-upstream') == remote_url
+    )
+
+
 def test_resolve_upstream_repository_uses_upstream_remote(gitdir: str) -> None:
     remote_url = 'https://example.com/project/upstream.git'
     ecode, _out = b4.git_run_command(gitdir, ['remote', 'add', 'upstream', remote_url])
     assert ecode == 0
 
-    assert _review._resolve_upstream_repository(gitdir) == remote_url
+    assert _review._resolve_upstream_repository(gitdir, None) == remote_url
 
 
 def test_resolve_upstream_repository_discovers_github_parent(gitdir: str) -> None:
@@ -4747,7 +4795,7 @@ def test_resolve_upstream_repository_discovers_github_parent(gitdir: str) -> Non
         'get_requests_session',
         return_value=mock.Mock(get=mock.Mock(return_value=response)),
     ) as get_session:
-        repository = _review._resolve_upstream_repository(gitdir)
+        repository = _review._resolve_upstream_repository(gitdir, None)
 
     assert repository == 'https://github.com/project-org/project.git'
     get_session.return_value.get.assert_called_once_with(
@@ -4765,7 +4813,7 @@ def test_resolve_upstream_repository_uses_non_fork_github_origin(gitdir: str) ->
     with mock.patch.object(
         b4, 'get_requests_session', return_value=mock.Mock(get=mock.Mock(return_value=response))
     ):
-        assert _review._resolve_upstream_repository(gitdir) == origin
+        assert _review._resolve_upstream_repository(gitdir, None) == origin
 
 
 def test_update_all_tracking_counts_upstream(

-- 
2.43.0

