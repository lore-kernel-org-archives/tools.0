Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC74D6C53
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222354; cv=pass; b=bfphjgneZYTjqpO40KVw0sVftjkunkcjPPU0FJ5C1UWlW+TN0jsgn1EC1MAcwdz9VYLMQSqDXU83wPVEVG0Bng6Sx8xgfJPmex4AMC7hrWLsC0CedSXgMTLbkINm4qv35NHbUBH5k6dv74Y9oxlVM8r7+5C25zt7d/bBPaB/Edo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222354; c=relaxed/simple;
	bh=xU0xmj1Q7npu7UOvRty46dirsJQfyUcObuswhfLwDd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VaqnyISeV2mLQ/zpCUzmSYsGli8uDFDPdx5KNAIX4sj7fWhcgTwI1GDIpSkuzUi13izKkNMI8cFOm8GHsHiEhijr5NwUBV11cW9mrfiq3gp4FDqmsYYeK3z2bzO78GY0snYUY2H/LNyTk15MrHDFs/b+geHxlrxxew1Rvardr9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=amoP+h4Z; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="amoP+h4Z"
Received: by smtp.kernel.org (Postfix)
	id 5B84B1F00899; Mon,  5 Oct 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.98
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791222352;
	b=mMqKbzrjfP5aiJoAmfK0PAfH/bur3D473HFiSqK98+avI2Naditem2oN7D0O1LI6IcLH
	 07RquDyC0MbID6IenMe0Fn2+/M1gzLEVvpTd3MaBy+9PNNL4oFExo0rL/W2Z1wmXrvQWV
	 6HWyAQJu8IH/+BvZZdXU1OAUPcKVugyI+MmKhk0OVshNg284WKvKaHfsDsRBaWaHqFCxY
	 7jh9RvIIMydQMKReFWLjndr8jIpZpPWLFXb8gfV9fZgNVmDuQQvl4D6gy5rsrN6FjTKj7
	 NhR8qZ60iHOlbtfT5BjHBjm7JrqoP+yvua5XX+uDyLiTn+mCfBNkrBRSP/lIT8rQYDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791222352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qwo3c6F+UWBlvwJccIyaIYTOfcuWJEMICzXGwLQCsgM=;
	b=JTgAvVsdJkP79eSDfN4ZYb7/V9TG1eTq+SeS4/2SeEdFdk+7NT09LADRO8NJGlW3Ao43
	 oc1Hp7d8tMBt5UaEO2nu4SdihgELlScaWu2cF6efD5W510wFIsz/Ilud2wpUyxOCcHMMV
	 I/e+LVMeBaxnBhSP+fVe8au9kjfOu28z4TNUFfEpMg78D01arunJTPH0dummI3V2ZFS70
	 Cf26e8K/9a4HUXZFwI+Y9uXA0/sC9lYdvH++pU7E3IcTLxBUGXkW34qQXIK7iux9TzQLr
	 RkUF6IqV2b9yWAKShywAfO22qsDMFBqsryT258E6MyGtNth+GaXoqVnVQSbVubYDwZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=amoP+h4Z;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.98
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4533D1F00893
	for <tools@kernel.org>; Mon,  5 Oct 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=amoP+h4Z
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4533D1F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso1144883f8f.3
        for <tools@kernel.org>; Mon, 05 Oct 2026 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791222349; x=1791827149; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qwo3c6F+UWBlvwJccIyaIYTOfcuWJEMICzXGwLQCsgM=;
        b=amoP+h4ZEqy73N3qysF0o97C+xAifodkUBWXk1RGyeY/RcfOvavioMQE7zvOYidc7K
         5vhWowBruymTBeqSuC/CA+41EpPD4YwMw3iNBck6XGXOIFRQFiWYCifsjwn2Lh/U2ssb
         X/lLIpDV7uFJMuQu8YwJTcM4Nifuk/ULliyDfi5lqSD/U88VujP/MV3+z7rgw1CtATxv
         12j9Ki3PAPGKxCH6mT0Wm9IWwxKW/c1zac8jff63XzF7HtTBlqNJbc/2Ilqs+rOmsWS/
         5IkxhNtPThNwY8QOTeI6JLthtzK78W8xRVBDamkZBITAhBsgg0VWFnXvFWRJe9P75cBk
         k/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222349; x=1791827149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwo3c6F+UWBlvwJccIyaIYTOfcuWJEMICzXGwLQCsgM=;
        b=g5awRgpxt+YEvJ/OrKkMZ5fVVNESSCtlJGqdFRIb986gsso3OzZK/4JOW/RtU12ODS
         Yk4bQqQayi29Y0XR1v6VooqkdRhL5MX6DvfHI4SF4+basKPpY3j29tMD4lw1yzK27rVW
         Q2ZpMaV7gSXXFQuQvi362s2/mBjjHulWy7qawIdRxq34s9EpIeDJN12MEeTfB1HgnoEQ
         7nAOekz2QM9wWFLiQ+bnOsoqVVFCzUzcORQgSkQh6Q4XCXCBJ2wUEeCPzRj+A5G0Vzpk
         LYoT3bhFGTjhtU+LIH6HDqZxqtEB0LBpfmknRNeUTHywpnwW5u8OJ//eIjz6ww5DeH4f
         rG0Q==
X-Gm-Message-State: AFq9FYLPLbHsb7AnmA2LIu6qm7bz/Wz6xY31Wsp9pZFexCC65Wz8FvlK
	YKBg9aejpYvAgmwYKLXiQaoI+OrsKJz1jHpfxeOxVOu2iDhfvTP5XwxrdlOK1sBwHdatB3KdIb9
	Hl/aw
X-Gm-Gg: AYBFou20gEap/aGIbNx0dqLmlRVkugUD9jhlQjYqcpNMlXPwScSdhO019KTxVVFx/jj
	uPIoKprTmFgFZ42PvdEKh9z4GFO/HZ1rrJOxSUT7FP/W3Bxnai05f9RN5nWOPU2IIy4ob6/ksFD
	K0ZsxBnY+ULBSmZJtJVVL79d/MZf9/mXHiZJ5zFFoQHEaZRfKstMQ2mD+NCuPc7Gr8zuem7jtNQ
	UkyDqme+bSQWkGcAiGASE1A3D0GgKTaaw5LJO/GYF+S4bvTKZaO4cKcRY2ngWGEfWHp7tACp1FG
	myQuSc2f1zZghh5D6eDpMOcNqeEZZQHGfBLF32sBeSwkqkKhB3ezJPrzC5roJ9Gxj2G+LmMwRcS
	fvZ8IG7kRRIsP0apEwSPb5z9XYyFBk9IlVnBS5ecyciwyqEZptvTrm5qLDYFcKRk9KQ3Pye+0EO
	59CS4r3Z3nWqNy/ITvo4RJnmzaQrWAbRkJijvQ/f0aMAyE7xa7h2vbLLfUGRr7uJU2t1+zFe4TV
	OicBoBWMqQAfncweVcA
X-Received: by 2002:a5d:6f0a:0:b0:48c:58e7:942e with SMTP id ffacd0b85a97d-48c58e79a5cmr10029023f8f.49.1791222349499;
        Mon, 05 Oct 2026 10:45:49 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm11526721f8f.15.2026.10.05.10.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:45:49 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 05 Oct 2026 19:45:42 +0200
Subject: [PATCH b4 1/5] review: report a failed track retrieval instead of
 crashing
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-b4-send-b-v1-1-7f6ed23f5106@baylibre.com>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

When "b4 review track" finds nothing to fetch (offline mode, a missing
mailbox, an unknown message-id), the retrieval raises LookupError.
cmd_track did not catch it, so the user got a Python traceback:

  $ b4 --offline-mode review track <msgid>

Catch LookupError, print one error line and exit 1, like "b4 mbox" and
"b4 prep" already do.  Ctrl-C still exits 130, and any other error
still shows its traceback.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/review/tracking.py         |  25 ++++---
 src/tests/test_review_tracking.py | 141 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 10 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 0f29da9f8bb2..556db6b2f37d 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -633,16 +633,21 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
     try:
         _msgid: Optional[str]
         msgs: Optional[List[Any]]
-        if rethread:
-            logger.info('Rethreading series from %d message IDs', len(rethread))
-            # retrieve_rethreaded_messages reports whether it actually had to
-            # stitch the patches together (was_rethreaded), or found and used
-            # a properly-threaded copy of the same version posted to the list.
-            _msgid, msgs, was_rethreaded = b4.retrieve_rethreaded_messages(cmdargs)
-        else:
-            logger.info('Retrieving series: %s', series_id)
-            _msgid, msgs = b4.retrieve_messages(cmdargs)
-            was_rethreaded = False
+        try:
+            if rethread:
+                logger.info('Rethreading series from %d message IDs', len(rethread))
+                # retrieve_rethreaded_messages reports whether it actually had to
+                # stitch the patches together (was_rethreaded), or found and used
+                # a properly-threaded copy of the same version posted to the list.
+                _msgid, msgs, was_rethreaded = b4.retrieve_rethreaded_messages(cmdargs)
+            else:
+                logger.info('Retrieving series: %s', series_id)
+                _msgid, msgs = b4.retrieve_messages(cmdargs)
+                was_rethreaded = False
+        except LookupError as ex:
+            # The retrieval's "nothing to fetch"; elsewhere a LookupError is a bug.
+            logger.critical('CRITICAL: %s', ex)
+            sys.exit(1)
         if not msgs:
             logger.critical('Could not retrieve series: %s', series_id)
             sys.exit(1)
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 9a84bb34cab2..0ec0a1564bfe 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -5,6 +5,7 @@ import logging
 import os
 import pathlib
 import re
+import signal
 import sqlite3
 from email.message import EmailMessage
 from typing import Any, Callable, Dict, List, Optional, Tuple
@@ -2673,6 +2674,21 @@ class TestUpdateSeriesTrackingCounts:
 # ---------------------------------------------------------------------------
 
 
+def _track_cmdargs(identifier: str, **kwargs: Any) -> argparse.Namespace:
+    """Build the namespace "b4 review track" hands to cmd_track.
+
+    Mirrors what sp_rev_track defines, so the tests drive the same code path
+    the CLI does.
+    """
+    defaults: Dict[str, Any] = {
+        'series_id': None,
+        'identifier': identifier,
+        'rethread': None,
+    }
+    defaults.update(kwargs)
+    return argparse.Namespace(**defaults)
+
+
 class TestCmdTrackCancellation:
     """cmd_track exits with code 130 when the network operation is interrupted."""
 
@@ -4895,3 +4911,128 @@ class TestAutoWakeSkipsCheckedOutBranch:
         woken = review_tracking.auto_wake_snoozed(identifier, gitdir)
         assert woken == 1
         assert self._status(identifier, change_id) == 'replied'
+
+
+class TestCmdTrackRetrievalFailure:
+    """A LookupError from the retrieval becomes one CRITICAL line and exit 1."""
+
+    @staticmethod
+    def _cmdargs(identifier: str) -> argparse.Namespace:
+        return _track_cmdargs(identifier, series_id='wanted@example.com')
+
+    def test_offline_retrieval_is_reported_not_raised(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """conftest pins b4.can_network off, as --offline-mode does."""
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='track-offline')
+        )
+
+        with caplog.at_level(logging.CRITICAL, logger='b4'):
+            with pytest.raises(SystemExit) as excinfo:
+                review_tracking.cmd_track(self._cmdargs('track-offline'))
+
+        assert excinfo.value.code == 1
+        assert (
+            'CRITICAL: Cannot retrieve threads from remote in offline mode'
+            in caplog.text
+        )
+
+    def test_the_retrievals_own_words_reach_the_user(
+        self, gitdir: str, tmp_path: pathlib.Path, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """Whatever the retrieval named is what the user is told.
+
+        retrieve_messages() raises a LookupError per reason it can have --
+        a mailbox that is not there, a message-id missing from the one that
+        is -- and the handler must pass that text through rather than
+        substitute a report of its own.
+        """
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='track-nombox')
+        )
+        missing = tmp_path / 'nonexistent.mbox'
+
+        with mock.patch(
+            'b4.retrieve_messages',
+            side_effect=LookupError(f'Mailbox {missing} does not exist'),
+        ):
+            with caplog.at_level(logging.CRITICAL, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_track(self._cmdargs('track-nombox'))
+
+        assert excinfo.value.code == 1
+        assert f'CRITICAL: Mailbox {missing} does not exist' in caplog.text
+
+    def test_the_sigint_handler_is_still_restored(self, gitdir: str) -> None:
+        """The finally: clause has to run on this exit path too.
+
+        cmd_track installs a SIGINT handler that cancels the in-flight lore
+        request; leaving it behind would have the next Ctrl-C in the process
+        cancel a request that is no longer running.
+        """
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='track-sigint')
+        )
+        before = signal.getsignal(signal.SIGINT)
+
+        with pytest.raises(SystemExit):
+            review_tracking.cmd_track(self._cmdargs('track-sigint'))
+
+        assert signal.getsignal(signal.SIGINT) is before
+
+    def test_cancellation_still_exits_130(self, gitdir: str) -> None:
+        """A LookupError handler must not shadow the cancellation contract."""
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='track-cancel')
+        )
+
+        with mock.patch(
+            'b4.retrieve_messages',
+            side_effect=liblore.OperationCancelledError('cancelled'),
+        ):
+            with pytest.raises(SystemExit) as excinfo:
+                review_tracking.cmd_track(self._cmdargs('track-cancel'))
+
+        assert excinfo.value.code == 130
+
+    def test_unrelated_exceptions_still_propagate(self, gitdir: str) -> None:
+        """Only LookupError is turned into an exit; nothing else is swallowed."""
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='track-propagate')
+        )
+
+        with mock.patch(
+            'b4.retrieve_messages', side_effect=RuntimeError('something else')
+        ):
+            with pytest.raises(RuntimeError, match='something else'):
+                review_tracking.cmd_track(self._cmdargs('track-propagate'))
+
+    def test_a_lookup_error_past_the_retrieval_still_propagates(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """KeyError and IndexError are LookupErrors too, and past the
+        retrieval they are bugs that want their traceback.
+
+        get_extra_series() reads getaddresses(...)[0][1] off the base message,
+        so a message with no From: raises IndexError from inside the block a
+        handler around the whole retrieval would have turned into "CRITICAL:
+        list index out of range" and exit 1.
+        """
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='track-lookup')
+        )
+        monkeypatch.setattr(b4, 'can_network', True)
+        msgs = _series_msgs('lookup', AUTHOR, 1, 2)
+
+        with (
+            mock.patch(
+                'b4.retrieve_messages', return_value=('lookup-v1-p1@example.com', msgs)
+            ),
+            mock.patch(
+                'b4.mbox.get_extra_series',
+                side_effect=IndexError('list index out of range'),
+            ),
+        ):
+            with pytest.raises(IndexError, match='list index out of range'):
+                review_tracking.cmd_track(self._cmdargs('track-lookup'))

-- 
2.56.0

