Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA514D6C49
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222355; cv=pass; b=SQFrdHAfLKf3Pvuupxp5R8hnr3ZB0QY/MgHHeGvWgJ8iIPFhMsxDp6Ol1fq2hS9LJ/kRs3BcOWYtYpvBxh5pur8N/BBXA6XLUnd6VNyHxy3JAqNykcSjvFe/EEjsVbQocGx6nJzcGajycWTF4qf/NF+PHRUb0bQd0yY22m95ugc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222355; c=relaxed/simple;
	bh=M3BIuaUQNCISJ2YoCoI7ZDXXxxkoX+ar6vzahuGk54M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbooWcnr6LNdZ++0rB51l8sfVVMyQCTklQPUl9fILdFaxFCaOdrVvTDBOOiHZkG+ZRSk9drZ408JfMuljhJig+30apNZ5Qw/3mKJUwLzpnlRpga9Fs022WMg8MV+0QszMXwqqOrQPUH9ieA6J9Qn5bu7e1+nbQ4COGeH83wFVOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Wl0H0Ywv; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Wl0H0Ywv"
Received: by smtp.kernel.org (Postfix)
	id DC8771F0089A; Mon,  5 Oct 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791222352;
	b=S9VA0r0J2FDS+KsZZ41PaYVMPhqRe8YLbzTa9BuMH+kLK1XFv/OhEZ9JVtR7f231tfT5
	 4jzkoVUVem7y44PIl6Oljw6LgBx7DhZkIAlMxqOB+tbpu05tRp2XCPrlsLp2ioa/Zr3X7
	 L+9MaG/z2oJfQMJUgqIS4OGT7V5WFHwTwkVvd4fl9NTMye6tUBGGPMrVzWrmHfAsD6sjn
	 LyaKgQFfMdXe9NFZav5/XKgNKVZd8jtPqH7vMdXyuLP/MY/CFdjSSlormtZJ99ZIo7Drs
	 Xee08I9nJJJf/mt+lfFP+fkgIwzBTtiDb0zh8cq2VbUBI7oAqL4xaSJDbY9XobIbqnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791222352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=q0/gfmK2bfC4nrT/SNR0DbynBaPLi2Jdh5IyM1wDQ5I=;
	b=M+C3WQiEPDlqjSdHYYM5pvpp/Chh+XKkFO/Q0KjGtCjocBkUK1LZSjr41el9jRF0mNIf
	 NVxbm7J8PzYKPLkL8D7CX71j7pvjP7KAIjNUJTHoyHeG5uAkAvW7AFaNYyrl48FKZ8E09
	 yT8y1Zo6C5lSyz4V4t2rgSbGq/8sZngEW1l+WQGyZg1/l275aXuLgBwrLNaHTKMAnkk1l
	 iazeo4kOdOb7YKhiPcK3nsPI/gnUvCKUoYppYO7DR+2sEQ4WhJgeRUSNDxUqU3xnb1KZr
	 TargDZTtUh8Bq5OmzF7rX2vU3mSjwuXoGH36OgIB1XgfgI11zocr56pIW8D4xph2UjQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wl0H0Ywv;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E3B91F000FF
	for <tools@kernel.org>; Mon,  5 Oct 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Wl0H0Ywv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0E3B91F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso10904985e9.1
        for <tools@kernel.org>; Mon, 05 Oct 2026 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791222350; x=1791827150; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0/gfmK2bfC4nrT/SNR0DbynBaPLi2Jdh5IyM1wDQ5I=;
        b=Wl0H0Ywv2qRAgiEcy4E15+1BIIERN8ZYmbsyH51K2C/tkOHjOAiQjbHeV9cDU3i5Rb
         6T01tJ0dB1h3zjh+L+vzwVylFY9Iy5Am1JT86isLHPtfWT2ZT4Kk9ZGPRXLowjdAsAKZ
         rehfQX02cA7p2BY63wu6EiEl/bN/Q43V0CIQZU3pBJdJdG7AtPgzI7M9IkHkZjqQqc6V
         XQ8sNU8c8WYuo0sRObV4o5GM9/VCjHrz+yQYE3diIfOKXdk+F6XAE4hz7sI1tXYjdMvl
         BiOEIq+JE+/l8pPFg16swzvpkqmUz4Qx+C97wDR6ZZ3mNEnpkL2Btqc63IO20ZlJuQHe
         fIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222350; x=1791827150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0/gfmK2bfC4nrT/SNR0DbynBaPLi2Jdh5IyM1wDQ5I=;
        b=zS9kO1S/GGQoRCX7r7J/G4IS1quWY7okleygUN8edkefy9brqerHeLcf/uKs9cLtdD
         OJ5Uq1IVVa2j7gAlg1v3THQknX7KV3NE0PjH2grfK9M+QPD0JuYEl7zZJhqt7R9oYmtS
         zauf9t6jUV27hfOzu2V/CA7FMOVhSY0ujg1Y0goXRiGeQDfgH7JQbebmmNTnrpgbuCcs
         +J/dR9GFINWG5u2EhuprPKTq1juTWx7jfCaChKoC47hbU30wFUR5zEH2IKBENu/BfrM7
         hQ28AA6kvCRpt++R+DVncLkAU5HyxpJJZp/AkzSUIxe6hlDBIZr5y56KxdZcUMTodnXc
         RACg==
X-Gm-Message-State: AFuF++nPZgAejnsM/WCke3Y1oidkGB/r6NtteSpdcihh3v8r9iOIcB7l
	P/jCNBKo16wcZr5lTLqsYpmnuDSLOAHsw2e8xF0aachwfyvSG803hpDiNzWrwqffxi/7zNpCzzB
	+8XNT
X-Gm-Gg: AYBFou0zfFOJcvsZbTuk4xJIZI2Tvfs0TtkSx6caqIl8YK09guBxTEYlrqnM8lcQ6wB
	aUTPK7+oXeIUd1+tK3DQSaVBuajEPR7jPAC17gJgQeFqDuIAa6Tny1PpmqTHnpBo53YHxOJ0yJ3
	W8D2SE4XWnPaYnf86hAwqLaBj1cWJf3Bg9VQ884YnyVCkbOeeFiWhHedEGHdLRe9ttRRV3jt9lf
	+mO9eiLrhTkLaC5OiFh5P6uBoQ2eI878DVun+Z0R9vH9u39P7I6ucpjCOrv0o7fJ8h+dG9vzf7K
	B5LACYfQRomW8E2tbuOVZAwIi9ogWgxTb9378if0A49mKdSZP2Ecn++JK425MMAa+p3NUGpaCzU
	KYWW/ErdMbumNm2iH/ydq84o/9+PVzcZBzlfSo0NPg5w4dPYYuXHvjm02RgDaDDzD3a9y1p+ZFA
	i3xVzFrq74sCDQO6q9SYf9qrZSh8h3gk4n+nCGKqgagFuyX7Ppskv4xg81m/2kY7qr3wUXA1+MC
	rCNG/z7Fw0Fnk7qaPYs
X-Received: by 2002:a05:600c:34cc:b0:4a1:6a10:4dc8 with SMTP id 5b1f17b1804b1-4a16a10504amr113950805e9.28.1791222350391;
        Mon, 05 Oct 2026 10:45:50 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178a175aesm10001575e9.2.2026.10.05.10.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:45:49 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 05 Oct 2026 19:45:43 +0200
Subject: [PATCH b4 2/5] review: honour --offline-mode in the retrieval
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-b4-send-b-v1-2-7f6ed23f5106@baylibre.com>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

With --offline-mode, b4 must not contact lore.  Two paths still did:

- "b4 review track --rethread" calls retrieve_rethreaded_messages()
  directly, but the offline check was only in retrieve_messages().
- Refreshing a series already tracked as rethreaded goes through
  _fetch_series_thread(), which had no check at all.

Add the check to both.  In retrieve_rethreaded_messages() it runs
before stdin is read, so a refused run leaves stdin alone.  Both use the
same error text as retrieve_messages(), so callers see the same error.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/__init__.py                |  9 +++-
 src/b4/review/_review.py          |  3 ++
 src/tests/test_rethread.py        | 55 ++++++++++++++++++++++++
 src/tests/test_review_tracking.py | 89 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 8e59a456e280..ecef70d16536 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6688,7 +6688,14 @@ def retrieve_rethreaded_messages(
     threaded copy of the same version already exists in lore it is preferred
     and returned as-is with ``was_rethreaded=False``; otherwise the patches
     are stitched into a synthetic thread and ``was_rethreaded`` is True.
+
+    Raises LookupError in offline mode: every message this stitches together
+    has to come from the list archive.
     """
+    # Checked here so every caller sees it, and before stdin is read.
+    if not can_network:
+        raise LookupError('Cannot retrieve threads from remote in offline mode')
+
     raw_ids: List[str] = cmdargs.rethread
 
     # Support reading from stdin with --rethread -
@@ -6739,8 +6746,6 @@ def retrieve_messages(
 ) -> Tuple[Optional[str], Optional[List[EmailMessage]]]:
     # Handle --rethread mode: fetch multiple unrelated messages and stitch them together
     if getattr(cmdargs, 'rethread', None):
-        if not can_network:
-            raise LookupError('Cannot retrieve threads from remote in offline mode')
         if cmdargs.localmbox:
             raise LookupError('--rethread cannot be used with --use-local-mbox')
         cover_msgid, msgs, _was_rethreaded = retrieve_rethreaded_messages(cmdargs)
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 3254b287cd3d..262af05ac39a 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -221,6 +221,9 @@ def retrieve_series_messages(
     is_rethreaded = series.get('is_rethreaded', False)
 
     if is_rethreaded and change_id and revision is not None:
+        # Same refusal, same wording, as retrieve_messages().
+        if not b4.can_network:
+            raise LookupError('Cannot retrieve threads from remote in offline mode')
         conn = b4.review.tracking.get_db(identifier)
         patches = b4.review.tracking.get_series_patches(conn, change_id, int(revision))
         conn.close()
diff --git a/src/tests/test_rethread.py b/src/tests/test_rethread.py
index 4aa6f56a84de..61e598e1a514 100644
--- a/src/tests/test_rethread.py
+++ b/src/tests/test_rethread.py
@@ -955,6 +955,15 @@ class TestFindThreadedCopy:
 class TestRetrieveRethreadedResendPreference:
     """retrieve_rethreaded_messages signals whether it stitched or found a copy."""
 
+    @pytest.fixture(autouse=True)
+    def _network_on(self, monkeypatch: pytest.MonkeyPatch) -> None:
+        """The lore entry points are faked, but the retrieval refuses offline.
+
+        conftest pins b4.can_network off for every test; these exercise what
+        the retrieval does with messages it did get, so say the network is up.
+        """
+        monkeypatch.setattr(b4, 'can_network', True)
+
     @staticmethod
     def _cmdargs(msgids: List[str]) -> argparse.Namespace:
         return argparse.Namespace(rethread=msgids, nocache=True)
@@ -1019,3 +1028,49 @@ class TestFindThreadedCopyTargetedRevision:
         t_patch, s_patch = _fake_lore(threads, broken_v6)
         with t_patch, s_patch:
             assert b4.find_threaded_copy(broken_v6, revision=99) is None
+
+
+class TestRetrieveRethreadedOfflineMode:
+    """--offline-mode is honoured by the rethread retrieval itself.
+
+    Rethreading has nothing but the list archive to work with, so offline it
+    can only refuse.  The refusal used to live in retrieve_messages(), which
+    is not the only caller: "b4 review track --rethread" calls the retrieval
+    directly and queried lore with --offline-mode in effect.  conftest pins
+    b4.can_network off, which is exactly what --offline-mode does.
+    """
+
+    @staticmethod
+    def _lore_mocks() -> Tuple[Any, Any]:
+        return (
+            mock.patch('b4.get_pi_thread_by_msgid'),
+            mock.patch('b4.get_pi_search_results'),
+        )
+
+    def test_refuses_without_querying_lore(self) -> None:
+        """No thread lookup and no search happen before the refusal."""
+        t_patch, s_patch = self._lore_mocks()
+        with t_patch as m_thread, s_patch as m_search:
+            with pytest.raises(
+                LookupError, match='Cannot retrieve threads from remote in offline mode'
+            ):
+                b4.retrieve_rethreaded_messages(
+                    argparse.Namespace(rethread=['c1@q', 'c2@q'], nocache=True)
+                )
+        m_thread.assert_not_called()
+        m_search.assert_not_called()
+
+    def test_retrieve_messages_still_refuses(self) -> None:
+        """The refusal reaches the --rethread callers going through retrieve_messages."""
+        t_patch, s_patch = self._lore_mocks()
+        with t_patch as m_thread, s_patch as m_search:
+            with pytest.raises(
+                LookupError, match='Cannot retrieve threads from remote in offline mode'
+            ):
+                b4.retrieve_messages(
+                    argparse.Namespace(
+                        rethread=['c1@q', 'c2@q'], localmbox=None, nocache=True
+                    )
+                )
+        m_thread.assert_not_called()
+        m_search.assert_not_called()
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 0ec0a1564bfe..097fb3367955 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4199,6 +4199,7 @@ class TestRetrieveSeriesMessagesRethreadSeam:
 
         progress_cb = mock.Mock()
         with (
+            mock.patch('b4.can_network', True),
             mock.patch(
                 'b4.fetch_rethread_messages',
                 side_effect=_fetch_rethread_messages,
@@ -5036,3 +5037,91 @@ class TestCmdTrackRetrievalFailure:
         ):
             with pytest.raises(IndexError, match='list index out of range'):
                 review_tracking.cmd_track(self._cmdargs('track-lookup'))
+
+
+class TestCmdTrackRethreadOffline:
+    """--rethread refuses in offline mode instead of querying lore.
+
+    cmd_track calls b4.retrieve_rethreaded_messages() directly instead of
+    going through retrieve_messages(), where the offline guard used to live,
+    so "b4 --offline-mode review track --rethread" asked the list archive for
+    every message-id on the command line.
+    """
+
+    def test_refuses_without_querying_lore(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='rt-offline')
+        )
+        cmdargs = _track_cmdargs(
+            'rt-offline', rethread=['one@example.com', 'two@example.com']
+        )
+
+        with (
+            mock.patch('b4.get_pi_thread_by_msgid') as mock_thread,
+            mock.patch('b4.get_pi_search_results') as mock_search,
+        ):
+            with caplog.at_level(logging.CRITICAL, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_track(cmdargs)
+
+        assert excinfo.value.code == 1
+        assert 'offline mode' in caplog.text
+        mock_thread.assert_not_called()
+        mock_search.assert_not_called()
+        conn = review_tracking.get_db('rt-offline')
+        count = conn.execute('SELECT COUNT(*) FROM series').fetchone()[0]
+        conn.close()
+        assert count == 0
+
+
+class TestFetchSeriesThreadOffline:
+    """A rethreaded series refuses offline instead of querying lore."""
+
+    @staticmethod
+    def _seed(identifier: str) -> Dict[str, Any]:
+        """Track a rethreaded v6 whose three patches are stored individually."""
+        conn = review_tracking.init_db(identifier)
+        review_tracking.add_revision(
+            conn, 'cid-rt', 6, 'rt-v6-p1@example.com', is_rethreaded=True
+        )
+        _insert_patches(conn, 'cid-rt', 6, ['rt-p1@q', 'rt-p2@q', 'rt-p3@q'])
+        conn.close()
+        return {
+            'change_id': 'cid-rt',
+            'revision': 6,
+            'message_id': 'rt-v6-p1@example.com',
+            'is_rethreaded': True,
+        }
+
+    def test_refuses_without_querying_lore(self) -> None:
+        """Not one of the stored patches is fetched before the refusal."""
+        series = self._seed('rt-offline-fetch')
+
+        with mock.patch('b4.get_pi_thread_by_msgid') as mock_thread:
+            with pytest.raises(
+                LookupError, match='Cannot retrieve threads from remote in offline mode'
+            ):
+                b4.review.retrieve_series_messages(series, 'rt-offline-fetch')
+
+        mock_thread.assert_not_called()
+
+    def test_refusal_matches_the_normal_path_word_for_word(self) -> None:
+        """Callers must not be able to tell the two paths apart.
+
+        Nothing downstream should come to treat an offline rethreaded series
+        as a different kind of failure from an offline ordinary one, and the
+        cheapest way to keep that true is to say the same thing on both.
+        """
+        series = self._seed('rt-offline-same')
+        seen: List[str] = []
+
+        for is_rethreaded in (True, False):
+            with pytest.raises(LookupError) as exc_info:
+                b4.review.retrieve_series_messages(
+                    {**series, 'is_rethreaded': is_rethreaded}, 'rt-offline-same'
+                )
+            seen.append(str(exc_info.value))
+
+        assert seen == ['Cannot retrieve threads from remote in offline mode'] * 2

-- 
2.56.0

