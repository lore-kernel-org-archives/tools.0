Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB63B305674
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222356; cv=pass; b=bFUHEvQlhrrpufBCVjCE+dxK98PTbCwIogkA9Vxg6knnlHhbpO16CF6TpG9MSiQe7DSDNKnScyNubVJsnwBLoD5F5Yt3jKXqc0bRbjdXqL8vi9rXrNkb/NZSenK+lzcju+h+fWeoDZtKgSlsfhzPX/5WRkDEb8Q3dTlIksvlCfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222356; c=relaxed/simple;
	bh=Im8PiOc350Yy2M6kGN605BgRnRO9ESq6OnrTPb+W19w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnkQYsyX/FoH0S0HVbKwb/rq7m8u/sN35OlKov1w4cyAj7/elAxaUe7LZd6naj0mOt8LEkT447azxY+/bzn2Ko5zcB7zryYbKeLFIxv2B+Ex63ArA5RfvQYv+mxJ8MsJgmOU2OzhMVRgPrBMOtGM4WlefUxWiz4OVzYcathGCHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LVQoQihT; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LVQoQihT"
Received: by smtp.kernel.org (Postfix)
	id 650421F00898; Mon,  5 Oct 2026 17:45:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.141
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791222354;
	b=FCtqUH2FllY/qzSKd+74xy82kaUkQzC8obSYIujc07MEJZbWdvGQHBrCqVPoEYN0tvxb
	 i0tKSbzx6/KOJOzsYwv+lMkFHP7fPmdJwt2MHsBC9ncuQzmWwTj73i/dUFJSbd5Dyr3P6
	 S3JCP/FDzqewiSvAOL2JTTF10/wMmWMeMf2NRvGp076DR34Q/UbUQI/dX9vwtqgWwXBd+
	 pLwNpx9bXa/cm0JB9xH2vkK5eX7ol8eitbz8aKp9FiaWwHK9nrg/o+3KWc1GloXnG6pv3
	 Tzh4UIIFZGWnQIDTSuK4ZoXHOxmOLmgByl9AUZVI4lpB5jztK5uDYO58gj2lVk9XsQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791222354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QcQn8OaGmmTgGPusUFvKKLSrTEL1mGlPxHAp02FYex4=;
	b=Z/dxb8e+nwMCe7YMXAqZPvQvigC24Gz61bky6IgY3mAWJ2MwUlimXuCvcGuNt8RzhOKS
	 q7h2Yipmzb+m2712QxeHOLZdkIPFysMfXnC8HTA305HV2FcxrLPF4+sNt4MnCPHfBnge3
	 N0RLiwz6hHngON0rKLIavGktgdtxf52GgtsOkpEIUt5t0jte4FObaEof4rDD/QSYstW4H
	 gmUTjeCytVydvE+pCDm6Vbuac/Po2ETP75URXrT2Sm3HCz2T7B61/izBf3VnQmUZdBDW3
	 8yKxLtVTn0N342as/xwFRLn4kLgHh4ndMuRWbgfj3PvoN+ufh2trcMFUOslsd8OsP+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LVQoQihT;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.141
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B08C1F00893
	for <tools@kernel.org>; Mon,  5 Oct 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LVQoQihT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9B08C1F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso16977635e9.0
        for <tools@kernel.org>; Mon, 05 Oct 2026 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791222352; x=1791827152; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcQn8OaGmmTgGPusUFvKKLSrTEL1mGlPxHAp02FYex4=;
        b=LVQoQihT/G/dTKPozkNuMqOfm/i9Ejlq1Ja5kjnlyGL8xA7LsG9RrkJi3nb6Br/onb
         GTEKPmfdoeTGaF2DvdrXVZPn/dtK/bM92F4MsTLhRLPnmVoO25pbmW+Emgb1cbSFhczB
         9ccm2NIqgY2oPrVecjlVh1Tn6lzvnIFjYWHL62qPakZZCni0LdyrLWMtuO2Z/Q9NPNoW
         wLNT4OooF693ZMdk+KToz35fymwzhHjEK/8jZHOT7pY/wWTvJKrvq2z34mCGpeWU9ObL
         V2lnAFObfz+Lc9Ww4t7EA0GqtXcsmupLx796VMIQbMNILwbRDJ1NE9PYcR4Xei9Kxw4q
         smgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791222352; x=1791827152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcQn8OaGmmTgGPusUFvKKLSrTEL1mGlPxHAp02FYex4=;
        b=mUI02FQC4w8sRgeYCKk6cpWBcRHeDTG+UDID3Dis7qBWaj8dydpDShPjvTdd86j/6n
         WvU33u9LbZI4xyEjr8nN3TM4bJJo2xOdZ1RCQCQUcu4Rdfvv2rnIUUF7b3DcIz6ISf8R
         SrEbHS4AqKPjuo5FIZZaUnwW0bQIrGQFdDihERB7WvRKvJibRu6nykPcP5vdyDUuVras
         PidwaeWvPTraSuMIJgS0aqgnQJtzR95d8zrQxFM3W7Kjz+ghQAbOdjj+Igk+UJSkJo1n
         TB5kYZMhP4cHe870Ysbi+jNK6V54bhtUVtNstjjb4Hq4Zi9fhFmkhkEA/VJI4Q27m99d
         SytQ==
X-Gm-Message-State: AFuF++mriZE0UvnnQXv0Jwgyxf6eN1gz1I/S99dwQOW2Y78JcOVest2d
	mwihwNBX8qplv2+PijabIl6blLar3Q6jRiZlybKw/MmraAmLlfemdvLd7bUBlIgwLX257RMmPUT
	30YSD
X-Gm-Gg: AYBFou04SBYeeCVXcwyWRC7KLOR53R49Han238gTV2IwBYfzBajr/XgE09Pe7uoCOLV
	pZXWvDbG69vdYKMXUlX8r904kLt3VQq0ZUv1BcwcXZ7DZ+OX+gsI3aIRi3jgMYTD1tC3NYArXOf
	YSNkUDuDYeg3hn/jUzREf2ZSi88//WZgcf6vKZ7w+6xgDWXBLDZBIECLoHUmPN+rS4q2wcS2fSv
	wnP8ZMXCkMX50wYRPOvNkuAXUlfXu5dgCq8j7WQiX5u2OpoBQ12Yv0/RmV+F3ZQK61W7/v6dT8p
	VUHV/xUJahFRTP0XXsr0Xq8tnJFbStmypsMrpo7RTdsyNB+iK7+dEJQJFDavxLPjvYQMyvpxZpC
	oq6guYDsMqkqkZA0Zk1KkMdEDi3qAwI7pg3SlBlGMqQU5q24KLkHr1PIybRKdqgM+0ZH0ip9VfU
	2yNpXvxmS7tn6zPp07EV5yPNpQCzsIql1STUsPdNv2k9dA2n9SMfzHBxy8Di35jRZUnsFz+2eze
	gZKa5jJrHJNV5g/LO4t
X-Received: by 2002:a05:600d:82c5:b0:4a1:7396:3749 with SMTP id 5b1f17b1804b1-4a1739638ddmr50606665e9.18.1791222351909;
        Mon, 05 Oct 2026 10:45:51 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03fef5950sm230845325e9.2.2026.10.05.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:45:51 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 05 Oct 2026 19:45:45 +0200
Subject: [PATCH b4 4/5] review: honour --no-stdin when forgetting a series
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-b4-send-b-v1-4-7f6ed23f5106@baylibre.com>
References: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
In-Reply-To: <20261005-b4-send-b-v1-0-7f6ed23f5106@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

"b4 review forget" had the same problem: it read stdin even with
--no-stdin, so

  $ cat something | b4 --no-stdin review forget

could offer to erase a series named in the pipe.  Only read stdin when
--no-stdin is not set, as "b4 review track" now does.

These are the only two commands that read stdin themselves.  The others
go through b4.get_msgid(), which already checks the option.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/review/tracking.py         |  4 +-
 src/tests/test_review_tracking.py | 88 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/tracking.py b/src/b4/review/tracking.py
index 119df81df635..0d9c069f652b 100644
--- a/src/b4/review/tracking.py
+++ b/src/b4/review/tracking.py
@@ -882,7 +882,9 @@ def cmd_forget(cmdargs: argparse.Namespace) -> None:
 
     series_id = cmdargs.series_id
     if not series_id:
-        series_id = b4.get_msgid_from_stdin()
+        # Default True: a namespace built by code has nothing piped in.
+        if not getattr(cmdargs, 'no_stdin', True):
+            series_id = b4.get_msgid_from_stdin()
         if not series_id:
             logger.critical('No series identifier provided')
             logger.critical('Pipe a message or pass msgid/URL/change-id as parameter')
diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 4529d38a1eb0..b9730fabf033 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -4776,6 +4776,94 @@ class TestCmdForget:
         assert self._rows_left('forget-checkedout', 'cid-gone')['series'] == 1
 
 
+class TestCmdForgetHonoursNoStdin:
+    """--no-stdin has to stop cmd_forget reaching for stdin as well.
+
+    Naming no series makes cmd_forget look for one on stdin, which is the
+    read the flag exists to prevent: the pipe belongs to the caller.
+    """
+
+    def _enroll(self, gitdir: str, identifier: str) -> None:
+        review_tracking.cmd_enroll(
+            argparse.Namespace(repo_path=gitdir, identifier=identifier)
+        )
+        conn = review_tracking.get_db(identifier)
+        review_tracking.add_series_to_db(
+            conn,
+            'cid-gone',
+            1,
+            'Archived series',
+            'Mark',
+            'mark@example.com',
+            '2026-06-01T10:00:00+00:00',
+            'gone-v1@example.com',
+            1,
+        )
+        conn.commit()
+        conn.close()
+
+    def test_no_stdin_leaves_the_pipe_alone(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        self._enroll(gitdir, 'forget-nostdin')
+        cmdargs = argparse.Namespace(
+            series_id=None, identifier='forget-nostdin', no_stdin=True
+        )
+
+        with mock.patch(
+            'b4.get_msgid_from_stdin', return_value='gone-v1@example.com'
+        ) as mock_stdin:
+            with caplog.at_level(logging.CRITICAL, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_forget(cmdargs)
+
+        mock_stdin.assert_not_called()
+        assert excinfo.value.code == 1
+        assert 'No series identifier provided' in caplog.text
+
+    def test_a_hand_assembled_namespace_leaves_the_pipe_alone(
+        self, gitdir: str, caplog: pytest.LogCaptureFixture
+    ) -> None:
+        """A namespace without no_stdin defaults to True here too."""
+        self._enroll(gitdir, 'forget-nostdin-default')
+        cmdargs = argparse.Namespace(
+            series_id=None, identifier='forget-nostdin-default'
+        )
+
+        with mock.patch(
+            'b4.get_msgid_from_stdin', return_value='gone-v1@example.com'
+        ) as mock_stdin:
+            with caplog.at_level(logging.CRITICAL, logger='b4'):
+                with pytest.raises(SystemExit) as excinfo:
+                    review_tracking.cmd_forget(cmdargs)
+
+        mock_stdin.assert_not_called()
+        assert excinfo.value.code == 1
+
+    def test_stdin_is_still_read_without_no_stdin(
+        self, gitdir: str, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        """The gate must not cost the piped-message workflow its input."""
+        self._enroll(gitdir, 'forget-pipe')
+        monkeypatch.setattr('builtins.input', lambda _prompt: 'y')
+        cmdargs = argparse.Namespace(
+            series_id=None, identifier='forget-pipe', no_stdin=False
+        )
+
+        with mock.patch(
+            'b4.get_msgid_from_stdin', return_value='gone-v1@example.com'
+        ) as mock_stdin:
+            review_tracking.cmd_forget(cmdargs)
+
+        mock_stdin.assert_called_once()
+        conn = review_tracking.get_db('forget-pipe')
+        left = conn.execute(
+            'SELECT COUNT(*) FROM series WHERE change_id = ?', ('cid-gone',)
+        ).fetchone()[0]
+        conn.close()
+        assert left == 0
+
+
 class TestUpdateSkipsCheckedOutBranch:
     """update_series_tracking leaves a checked-out review branch alone."""
 

-- 
2.56.0

