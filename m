Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76F44D9911
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222355; cv=pass; b=Su48Bpzy2l2minpe4PQKqewNcV28aKni4Z4hL8wFX1zLdDrq7OyyZM9Q3QXs49MBYyKqPrvCWn5C3a0GAqNWSSTDyQszkNwLOQ3bQSV7pqqEAHaO7/zjZ7ayFdF1h0s/cldlZgYroz0jCgn9jVg/AtcEHh40CLTyVIXgqHc2gYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222355; c=relaxed/simple;
	bh=LTta5syEvvxl7JJvvuiWEMm2viBjxTYT1lm1+kBmTQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWguHdDQQCU8VxHpmBOqAX+CKfBy9M1kVjsdXRahSk48Rz0uXs6VzrBNj+xNyCo7PHdxMR2lSOCnKz52eokdp/jUJFS1VT2YhSEYXLtwWegwunJqTh6yp2e5zd1cHdLSxhBnFyRpNmvAZcnadVoJdEqt8ANJmlbreEyBvhGMYtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Q7oK35NN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Q7oK35NN"
Received: by smtp.kernel.org (Postfix)
	id 5BC1E1F0089B; Mon,  5 Oct 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791222353;
	b=1iCqJDm2ZgbNEKDaHIxOVMvo5H++E/B5XkS7GDzp36y/PefZLu39cXwpsMZcnyGr5A7i
	 MJR1ENWZM+2c1emeT0Cd9BKd8VtQmewpwkyDSAMOdvSi7f1Cs8UUHEiUmdKUXoWcdrGPI
	 FQvj4nCVL0+vpf8dJilYQsQXP5qZaVvW8sg6/qLv/cmy9qVkGxaaCyR0GZ/nTjOk0SLNm
	 mJJqsHp81lE2XEB9muHMAi2FCYpOJohYvlBVpzrqHJUEbAIObAVjVy2/EEpXa5l2c7Mm6
	 Mv5Gpkta2tRt2wlcW3DbWpZZMxCVCSua7BLV5BhQxw5H5yg6+Yfa8DFbLlXTaD3eO4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791222353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=81Awq1JaLdeCrklnHQasvkgMuvwApOoaYM49PJlrxrA=;
	b=NonYYvp9dyFVEDktEd6YRR72fLY6sPWx+EdcHLwe0K8Tr5RdQCAp7lHvPiuKgZWDkh3H
	 uIdQ/36xwPOV1gbGr4Gicu+HLBzZPZoZgJWQpteTdWvQtpAX4VRQ0cwWY1IBEoOK94nJt
	 aaVfUamkyHheQCp2l7a+CBOsdOCK0n16XkHp55YI8ijL+mdlEpLKSMbqlMWmK5tZibTA6
	 uuSCnDwiPyCCeXH10SExcHttpA/pu2Y90qLKixQynRH539BBrK4M3jxYZKs4T3IIxTf0D
	 J9aDr6UlftGn2I4irBShq0j0plHkIWL7LFRjUOtSClORoITpm49OfR0fwC2DxAbovZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q7oK35NN;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.140
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE1261F00893
	for <tools@kernel.org>; Mon,  5 Oct 2026 17:45:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q7oK35NN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AE1261F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so10309615e9.3
        for <tools@kernel.org>; Mon, 05 Oct 2026 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791222351; x=1791827151; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81Awq1JaLdeCrklnHQasvkgMuvwApOoaYM49PJlrxrA=;
        b=Q7oK35NNYDA3YIpxdHQRuHEHbJhB1QfPvKueOTlJdGSaQbElFJ/XgTOcwHd+7r8YKO
         Qmt1ZhMNxT6OPrAYzoAMHm70Hop23eU3inNIsOO6QacDmkOGn1VgY+4k2I9KOdEeSTS+
         aW3PnzsQmsJQaRmF8xV8jVz/cBALJH2B3xXSgCTUFBHjJAxf17GTgRk5zuKW+1cFols6
         weTiACzMDcQD0ElrjTJtS0Mn5Or/x1Ub5a2hop/ErNR7XjmlmGy9R/4JHpCWXeridQY1
         ZZdm5e7brB4pzmqTUWOtt8u9tD2xw/rJNkL5Nc1AJ/AXZiOWMoRhBji6mocVq6+MLH/n
         OJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222351; x=1791827151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81Awq1JaLdeCrklnHQasvkgMuvwApOoaYM49PJlrxrA=;
        b=ppqsvSXgfm6qOQRP27PxgKZybXHSijV84ZeYLcJYCyatnQ9afB3AgAjXKe/8Wt3TPc
         MqGX73rm4CFKr+gEBgT4yA2xGt4tdbf2TiK00JDykD/qcwGltYOTlchnXqk4PCMUfxzU
         lA6TBQVm98nHFkPNyBXDtqTill9jIooditcWaT4Gcd+0KmeAD0uVLorQca6RZ4mjGsDn
         vjieB8I/UL/+JZTRuXJKjXyAmeMf7pRO6oVVcv8cV/aIbW+pBxGzUn4KsQW4Zo6rp8Ey
         mCwkwpn2ZyxHRSlavl/INiTCW3eVnenFcCOino8qL2sMONrIrMjLRVUs9+7AaSygiumH
         j0wQ==
X-Gm-Message-State: AFuF++kS4zi9wMRezgDGfMgNvS7h4kF8mR1h/SHuCcNFi6KN/2dUiDG9
	egQh+YnGS89yCgEn7k4myQQrGI05GyaAjEQUNhpyptGTxEe69/q2DFiumqgT6xSJhRJz3FcAnIJ
	JX/YT
X-Gm-Gg: AYBFou1w5hrCRdVGgUDT8OEmgeMdlWyWHstH33r82P0OigtiDKak4ImIlntIPuHHCQH
	M47cKBxUTt/wT8O8P/tlCnpCfkGF3pGK3SKJzf4RtZlgcfXxBG750wrlq1VvmiZOaAU8DbT9rOo
	6AilvyfCQL+JHPYAlb/4Kjvyl6N+P9DZTWUIzIF8d6pD/KU7/Tvq6AtIR5dNzuJASigrb+XqJAY
	ZNXM6gy8ujZxCkIwB9+B4Mln+FLwE8ztQUg+ZxwmYvFxS0In3fvm3XRDIgnMxJy3M7z5BS9HXRO
	onWuvgBeAk/V0e883nhuQ/0gQ9AyzVqa06wiZ+O+Bb4lNWOox/1h9im83CIbqIOhKRVb6dCYmjk
	LoBqElIzGUY7A65+dtRXY8C72pcccHV2jK/eWn5YARl3gL0ybSxgEX7WecWn5EgzEyx0J53nSc1
	hclW364cV+VRVkWesaOq9+YjIvgaIqVpEu1i5bl1DVGRnJ8qqzUeg4RT6ackKehd1SJ2H2sn3tH
	N6ehB7gwOW86EuehtBI
X-Received: by 2002:a05:600c:c088:b0:4a0:1c10:12ee with SMTP id 5b1f17b1804b1-4a0275194e3mr157146745e9.3.1791222351142;
        Mon, 05 Oct 2026 10:45:51 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178ca806fsm5548085e9.3.2026.10.05.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:45:50 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 05 Oct 2026 19:45:44 +0200
Subject: [PATCH b4 3/5] review: honour --no-stdin when tracking looks for a
 series identifier
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-b4-send-b-v1-3-7f6ed23f5106@baylibre.com>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

With no series on the command line, "b4 review track" reads a
message-id from stdin.  It did so even with --no-stdin, the option that
tells b4 to leave stdin alone:

  $ cat something | b4 --no-stdin review track

Only read stdin when --no-stdin is not set.  Otherwise the command now
stops with "No series identifier provided".  If the arguments were
built by code rather than by the parser and have no no_stdin field,
treat it as set: nothing was piped in.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/review/tracking.py         |  4 +-
 src/tests/test_review_tracking.py | 87 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 556db6b2f37d..119df81df635 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -608,7 +608,9 @@ def cmd_track(cmdargs: argparse.Namespace) -> None:
     else:
         series_id = cmdargs.series_id
         if not series_id:
-            series_id = b4.get_msgid_from_stdin()
+            # Default True: a namespace built by code has nothing piped in.
+            if not getattr(cmdargs, 'no_stdin', True):
+                series_id = b4.get_msgid_from_stdin()
             if not series_id:
                 logger.critical('No series identifier provided')
                 logger.critical(
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 097fb3367955..4529d38a1eb0 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -2678,12 +2678,13 @@ def _track_cmdargs(identifier: str, **kwargs: Any) -> argparse.Namespace:
     """Build the namespace "b4 review track" hands to cmd_track.
 
     Mirrors what sp_rev_track defines, so the tests drive the same code path
-    the CLI does.
+    the CLI does, with --no-stdin set so no test reads the real stdin.
     """
     defaults: Dict[str, Any] = {
         'series_id': None,
         'identifier': identifier,
         'rethread': None,
+        'no_stdin': True,
     }
     defaults.update(kwargs)
     return argparse.Namespace(**defaults)
@@ -5125,3 +5126,87 @@ class TestFetchSeriesThreadOffline:
             seen.append(str(exc_info.value))
 
         assert seen == ['Cannot retrieve threads from remote in offline mode'] * 2
+
+
+def _parse_track_args(argv: List[str]) -> argparse.Namespace:
+    """Parse *argv* with the real b4 parser.
+
+    b4.command is imported here rather than at module scope so the whole CLI
+    is only built for the handful of tests that need it.
+    """
+    import b4.command
+
+    parser = b4.command.setup_parser()
+    return parser.parse_args(argv)
+
+
+class TestCmdTrackHonoursNoStdin:
+    """--no-stdin has to stop cmd_track's own look at stdin as well.
+
+    b4.get_msgid() consults cmdargs.no_stdin, but cmd_track reaches for a
+    series identifier on stdin itself, well before the retrieval gets that
+    far.  Ungated, "cat something | b4 --no-stdin review track" ate the pipe
+    the caller had asked it to leave alone.
+    """
+
+    def test_no_stdin_leaves_the_pipe_alone(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='nostdin-gate')
+        )
+        cmdargs = _parse_track_args(
+            ['--no-stdin', 'review', 'track', '-i', 'nostdin-gate']
+        )
+
+        with mock.patch(
+            'b4.get_msgid_from_stdin', return_value='piped@example.com'
+        ) as mock_stdin:
+            with caplog.at_level(logging.CRITICAL, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_track(cmdargs)
+
+        mock_stdin.assert_not_called()
+        assert excinfo.value.code == 1
+        assert 'No series identifier provided' in caplog.text
+
+    def test_a_hand_assembled_namespace_leaves_the_pipe_alone(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """A namespace without no_stdin defaults to True here too."""
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='nostdin-gate-default')
+        )
+        cmdargs = _track_cmdargs('nostdin-gate-default')
+        delattr(cmdargs, 'no_stdin')
+
+        with mock.patch(
+            'b4.get_msgid_from_stdin', return_value='piped@example.com'
+        ) as mock_stdin:
+            with caplog.at_level(logging.CRITICAL, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_track(cmdargs)
+
+        mock_stdin.assert_not_called()
+        assert excinfo.value.code == 1
+        assert 'No series identifier provided' in caplog.text
+
+    def test_stdin_is_still_read_without_no_stdin(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """The gate must not cost the piped-message workflow its input."""
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier='nostdin-open')
+        )
+        cmdargs = _parse_track_args(['review', 'track', '-i', 'nostdin-open'])
+
+        with mock.patch(
+            'b4.get_msgid_from_stdin', return_value='piped@example.com'
+        ) as mock_stdin:
+            with caplog.at_level(logging.INFO, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_track(cmdargs)
+
+        mock_stdin.assert_called_once()
+        assert excinfo.value.code == 1
+        assert 'Retrieving series: piped@example.com' in caplog.text

-- 
2.56.0

