Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792488532;
	b=V0UxvcH6eYVU00Imnt0AexMZXMaj2eOrcSpX/tSTu8tIvcj3UpWs+Ebzz6TkTr8bQ8xK
	 NZbxSbkuj8Qz2ci6gS2MX79HxvDOvC8WitGWlHVK0oq6Kx2hS0K/88RR3SJbl/L23P3X9
	 TritHZMWot0PJwGQsZT6S0PBhK63sT+0wnWGDEXLg44/VgMwPWs99xJFk3Yr9cVfb2v9F
	 gLkL2q/wO4GGQHalzJAspawwgleGzCREDnjkR3PRjABAd0aI6l0BaZkYIyGyM0JxoL90R
	 sYBMYR7xa1uI0r1WTW9nWPlVQ2pBT/TUR/pjIr++F48ldV1EgUO+j51kzISWyIOoZUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488532;
	h=Received:Delivered-To:Received:DMARC-Filter:X-Envelope-To:
	 DKIM-Signature:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVb4O3iYYaIUWPvFsUVOvHuuOHj5FQtilPYlTiLxDw4=;
	b=g3EPjYUvbckYwof7/+eLx1zb/P2g4ccN02Ul3Mho7JlF8JYW4L+2kxQV1GLYimmYHnh2
	 46I6BuseXusDciPu6ErhnDeQlxoWjhy5RPcLPaVYgvP9Yb0/sci1t57wrGdwyH1Ab25zK
	 z1mGzzOiKeL2OQ0vQsjePYd9kak9Q22Zlyqwv1OgDkmiq+nNeGRuhBbol4OGEY8Z9/NBa
	 DV1cIM0OAb1nnXi5fQSU4W0YTdtQZsr7BlhODZUTsme2/0l9ZVa2Z9JQDislJ82jq8+M3
	 u4bnsH7anjwzRbh08POsnmsUY/U/JKOkzHhtuaFcMp1oJzo2fsIM4teLLq2lXKluCMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MDJ6NGdE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D68B606A319
	for <tools@linux.kernel.org>; Tue, 20 Oct 2026 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MDJ6NGdE
Received: by smtp.kernel.org (Postfix)
	id 4A8A81F000C6; Tue, 20 Oct 2026 09:28:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=91.218.175.33
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792488531;
	b=yCl1bZ1dpPK+qsSk2V33OPzkKc3X7ERX6+riFgQcL6nnE8o0F5EK+S+4cgrmuZt5zf5K
	 unzjPIIcT2nEBFVn7d66h465k2WcazjFNRA8rRd0Zt+irlIZ1eHj1E3/tlhpA5T5cycbQ
	 PZ8bJiMy362cY3p2kKEKzNdEldhIawy6D3LUIJAQjwyU+MqkFIIbW0dgWdz5ACn8UbETE
	 i0a1a3y1962oqs/tf2r+cyljYxAAUYTM1qsjWtiUsDuxDz0CT1FfivqeQ0dt3nThB8E82
	 UaL7uFE5d4L8ogB79fIjc1M3X0s55gt7v8x1/X2rrd+fh8I1VmoRkXJIwl52VL/6RXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792488531;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=fVb4O3iYYaIUWPvFsUVOvHuuOHj5FQtilPYlTiLxDw4=;
	b=X569YZcW3G/tNwF0ZGNYW7IS2quLr+KnktrCznqGbFsFB1KSgDePgkj4+4qOvzIak2zu
	 BTOq9Gr/xTdEP6hhJ/+3OfQnCUHSCG4c44D8EV4AV4O92etS0H3luHLWucOC3GP3UBLCb
	 Pfn958uco8VGS8XY7KNDRkYj52mZcGga6Iq/yWUAElA/t9KUx7z4kahSU9a1maJJ+ELEF
	 qvD8kAerI/ZkeBrYoWp6ikDOKFJRiPI+qVrLjpymfdn0GNNEC6MfwQoZ74Q91TYwaH8/j
	 NH9eVZrPVMj8SdIeT4r5TQvnbbuidagFDn48d9eHDJUdIYh2DN2oTjOW2+5IY0LXFOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MDJ6NGdE;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.33
Received: from mta0.migadu.com (out-33.mta0.migadu.com [91.218.175.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6DF401F000C8
	for <tools@kernel.org>; Tue, 20 Oct 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MDJ6NGdE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6DF401F000C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=KQ/wC3dDIdKOHPkHn82qhPur+sRxll9IQGe3Ydu5iM4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792488528; v=1; x=1793093328;
 b=MDJ6NGdEH02ZNgxs1lNEz9IWQ4/TEUa56jyTpw1675ggnesMopK8QtLhJp02zf06H4R27GIt
 LEvYHs8j8AWYaMXovmG+SNH+l6ImWy7DqT11IM9wIhiJ7rBfvkLo08a8HZmi7q/MXVXVdGLg/M0
 B/8o7GM8KuTTtAj8BisbF3O8=
X-Envelope-To: tools@kernel.org
Received: by mta12.migadu.com with ESMTPS id 4581eb6912871af4;
	Tue, 20 Oct 2026 09:28:48 +0000
X-Mizu-Trace-ID: 4581eb6912871af4
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 20 Oct 2026 17:28:31 +0800
Subject: [PATCH b4 1/2] ez: use raw committer emails for identity checks
 and diagnostics
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-b4_mailmap-v1-1-55965f9201bd@kylinos.cn>
References: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
In-Reply-To: <20261020-b4_mailmap-v1-0-55965f9201bd@kylinos.cn>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

git log matches --committer against the mailmap-canonicalized
committer identity (log.mailmap defaults to true), and the %cE format
placeholder returns the canonical email even when --no-mailmap is
passed. So as soon as a tree's .mailmap gains an alias for the
developer's own address, the prep identity logic starts comparing
against the wrong value:

Use %ce in both places, and add tests covering a prep branch with an
active .mailmap alias over the developer's own address.

To reproduce the --claim variant, on a branch managed with `b4 prep -n`:

  echo "Your Name <canonical@example.com> <$(git config user.email)>" > .mailmap
  b4 --no-interactive prep --claim

Without this change b4 treats the series as someone else's work. With this
change it will leave the branch untouched.

Assisted-by: LLM [analysis, codegen, tests]
Fixes: 99a5be103419 ("prep: recover a branch whose cover commit was committed under another email")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 src/b4/ez.py         |  4 ++--
 src/tests/test_ez.py | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 2441badbb288..c1e964b2a013 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -945,7 +945,7 @@ def find_cover_commits(usebranch: Optional[str] = None) -> List[Tuple[str, str]]
         '--grep',
         MAGIC_MARKER,
         '-F',
-        '--pretty=format:%H %cE',
+        '--pretty=format:%H %ce',
         '--since=1.year',
         '--no-mailmap',
         usebranch,
@@ -1126,7 +1126,7 @@ def claim_prep_branch(branch: Optional[str], no_interactive: bool = False) -> No
         start = series_start
 
     lines = b4.git_get_command_lines(
-        None, ['log', '--format=%h %cE %s', f'{start}..HEAD']
+        None, ['log', '--format=%h %ce %s', f'{start}..HEAD']
     )
     if not lines:
         logger.critical('CRITICAL: no commits found between %s and %s', start, mybranch)
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 13c960babd89..71dd71637448 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -1358,6 +1358,52 @@ def test_rewrite_series_commits_explains_thirdparty(
     assert 'b4 prep --claim' in caplog.text
 
 
+# -- .mailmap gotcha (bugzilla 220695) ----------------------------------------
+
+
+def test_prep_survives_mailmap_alias(prepdir_commit: str) -> None:
+    """A .mailmap entry aliasing your own address must not hide the cover
+    commit from the committer-restricted search: git log matches --committer
+    against the mailmap-canonicalized identity unless --no-mailmap is given."""
+    pathlib.Path('series.patch').write_text('A change in the series.\n')
+    ecode, out = b4.git_run_command(None, ['add', 'series.patch'])
+    assert ecode == 0, out
+    ecode, out = b4.git_run_command(None, ['commit', '-m', 'series patch one'])
+    assert ecode == 0, out
+    orig_email = b4.USER_CONFIG['email']
+    assert isinstance(orig_email, str)
+    assert b4.ez.is_prep_branch() is True
+
+    # Alias our own address to a canonical one, as contributors do in trees
+    # that carry a .mailmap (e.g. the kernel).
+    pathlib.Path('.mailmap').write_text(
+        f'Canonical User <canonical@example.com> <{orig_email}>\n'
+    )
+    assert b4.ez.find_cover_commit() is not None
+    b4.ez.is_prep_branch(mustbe=True)  # `b4 prep --check` must not exit
+    _tos, _ccs, _tag, patches = b4.ez.get_prep_branch_as_patches()
+    assert len(patches) == 1
+
+
+def test_claim_under_mailmap_recognizes_own_commits(
+    prepdir_commit: str, caplog: pytest.LogCaptureFixture
+) -> None:
+    """With an active .mailmap, `prep --claim` must still recognize the
+    series as our own: the comparison uses the raw committer email, not the
+    canonical alias %cE would report."""
+    _stack_empty_patches(['series patch one'])
+    orig_email = b4.USER_CONFIG['email']
+    assert isinstance(orig_email, str)
+    pathlib.Path('.mailmap').write_text(
+        f'Canonical User <canonical@example.com> <{orig_email}>\n'
+    )
+    head = b4.git_revparse_obj('HEAD')
+    with caplog.at_level(logging.INFO, logger='b4'):
+        _run_prep('--claim')
+    assert 'nothing to claim' in caplog.text
+    assert b4.git_revparse_obj('HEAD') == head
+
+
 def test_claim_branch_description_restamps_series(prepdir: str) -> None:
     """branch-description keeps no cover commit, but --claim still re-stamps
     the series patches (fork-point..HEAD) under the current identity."""

-- 
2.55.0

