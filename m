Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC864AB1A6
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211643; cv=pass; b=OKqoihguypzUE3Y8IzKkdRbxe/ZybBhsc9Fa5Zj8U8CtgOE3ZpQ+glpboM0/C9OCa/AYeUiEpJIMWpzr8g8EOIQvE9Nc8i11Ux6XdsI0fqvesReNVu9jbdzpOQR4HR08DZsoSExCc3Tu4X2hhkuxkB71wv4s9+pIxKtJOokKL74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211643; c=relaxed/simple;
	bh=XVXye1TMppbDofcFNbZcyW2X5ZiLSbOn8rppUXOEYyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GkEoZ/HInkQohLsPCKpwunxDchCMr/SA+yPvPuXoqLhfoWvw83w7KTbonVnugOSi5IzANK6BRk05aUhyBJAvm6O9FjhCuMoLYcv5bN8E7PjlBKuR06sUrcHnUzAH2r5dGza6isxIL/JvqM5KqbIik3uwnZJnLF2zibqBg+h143I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i+XGKs6h; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i+XGKs6h"
Received: by smtp.kernel.org (Postfix)
	id B98191F00898; Mon,  5 Oct 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791211637;
	b=gQx2TXTMmPJmyYKbu/kx/+340vbcSXDyVboQzw0gqN/Z6oxPay/5cflO3NYOepVhBbhm
	 KbAu2lYI6fcRizkiCbRJ45eDdgZCmO8xoS469SesuxY9p8fxtGGrUXSF6CugVaGs3r31P
	 gFj4OggFQCxDXLMo/IuFGsq8EQovjZkVjB325l/D5j2W1GMC/VG8y3PKHCx/K6LDpajvI
	 jJ+E75lukyu4qyNGN77UOC27JwIKQH+veXLipUEU9rqF5tPU8Y754fWs9XlpyfB1baoiE
	 esnUcqG12mQt8SEpnIMGxVDLx3PMej5jZiOOH4VCZHtMz9G6y3+Mi+J7atOo8qnlRrA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791211637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=waG2gJVIBZUoUqrXWgGuY8fW/13uwwV7DB03P2cI7zY=;
	b=cfHua5u2HJOHYO4LTmm//yx1j+YT0DDFDVG37ND+sLpDryRnoov7wyBb9SRdI0zfc7bY
	 LtJ80Yj8lVPk/oKsb4hBUFfyuozWlPr4rVF6OYkVvhojkARxYkMwX0LdetvKdMTqHJdN1
	 JEr6O0C7jz1F0BqOh3p9t0Z9k5RDPOBMqkoGkPSxd17FUbvCsyeZFLyaCJkBluURoDiOe
	 pt1/CsXn8tH6ELuSC1mHZaFxFNFtClOGDZIDIiiRKLyxzP0/aQbzsy32nqS/ElOUwSsmX
	 m4EN5tCn0sMGoka1ZYwXULq2bXdKHIwLpw9FTZ42koeZVHQii+dEPdrWSl/nSvKETdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i+XGKs6h;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A9701F0089B
	for <tools@kernel.org>; Mon,  5 Oct 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i+XGKs6h
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5A9701F0089B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13590865e9.2
        for <tools@kernel.org>; Mon, 05 Oct 2026 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791211635; x=1791816435; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waG2gJVIBZUoUqrXWgGuY8fW/13uwwV7DB03P2cI7zY=;
        b=i+XGKs6hFCctAUtmpBEbFOkK3G2aimwY7VJ6kH6t88OgdVxP9z6Hj93084R8yk4MVQ
         8AayZPNEiWTNTUoAo6E/my0V/G9zmqOJgY5IcYe+66ywzCK5NH2NiCxoSztfqih4SYSD
         DjMLnh3vsFXTT1T5aA9ZoRgI9L9R0FxIk+gQQtinlDcS4LrT0LSMIxI8AMwnx7IyxRx6
         yuh1cigKexKIE2DYbrj7NG7oHT6Aqx9deFavUlv8eAZahxNuactjXXARdSmX+oGlZ98R
         19WcblhdNlniZWncKKHN46m8vRLprH3/0H8ffWgrjv+k1z8dY0t/gDT225FbSPIM9AQ9
         1Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211635; x=1791816435;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=waG2gJVIBZUoUqrXWgGuY8fW/13uwwV7DB03P2cI7zY=;
        b=kO7Gt2O/Pibyt869d06JI1o++wy8HQV9YTY4kLcnMkwWBUbfqvmANRm9CyFiK1b1yd
         UADpVlQbUQ9Gdl7VAAGn/GvYXpYX5xjeF469ZBEEfcoB6dPhBSV3GPIR2oG1HdFF/3wc
         cOUIDf+0p2bHzE3h6DOuU1P/H3CYmGDoyjn84qRIw/oEvkAP2piwfb9C8zfhMdvILfsj
         2WyK9O47fyfDf2Ysdq4TTJ3TgFAvMyhZqRLaAMW3L5rcfcNu4UAqUEP7xugRurqT+p7+
         S1VcbyTHKMQmQqG/R/7BA3pYrk/2uaOKaYp6vnpcQg7w+HN9ZCc1blj8o/i02NzmSUnf
         tcNA==
X-Gm-Message-State: AFuF++lOb0ltePdNMARdc3AsmgENiSoJRSj81kZKGGXxtMDiw86+2vQf
	eOKWpDzf4AXhJeY3u1OMNYLQDipGtLcOARhhJcymcCUwhucvd19uP16/Sdx6oMFIK3I=
X-Gm-Gg: AYBFou1QLM90xb39YdVG6iEQzxB+k2eJecv4xhFlViDgajzpjIqIj1kzgxR8BrYEx38
	KPhXfn8YMuCdTwUlPj+8jOecjQJfFwMcrupMBj4T4cpT8UY7MlTbFc6P9bvLDq0NrfcBhxtNnde
	CW78BmNOg0R3xnl1N5K6msbADOQUxSaJ+TAJJGn8X/MlYnMgqr/K4YBAnTLOBEOSHXSq9kK5l6n
	CldhsSIqjnFapghr8j0YMf2WBobR5h0D/R907CL22jW4V4P3yl9xd8xlwVWcUq1avoq0bubhfWr
	ZL9DBF02hnH6cSgw+GPzy/CJwCeZE6KvifxC1OsUmQFdM6xVGPzhohydVCcnauOLa/Bu+tSbkSS
	g+v9KReubu5o6r9OB4ch8jhJ/aWoq1b38UZBXeO5lWYexjSooTOStfEGNFXB66Igc3wd9/IO1qa
	J9UtrvEIGAOb+MK47CFqSj0YsNolmzs5tB5IchNOVAvqGv3mQiTThobf34R/vmbE9Yf+IZaFk/G
	CF0zyjS4WP9JkF2hQLf
X-Received: by 2002:a05:600c:4e13:b0:4a1:7367:5395 with SMTP id 5b1f17b1804b1-4a173675558mr38667885e9.2.1791211634617;
        Mon, 05 Oct 2026 07:47:14 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bfafasm371089105e9.8.2026.10.05.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:47:14 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 05 Oct 2026 16:47:06 +0200
Subject: [PATCH b4 v2] lore: stop a less pager quitting on output that fits
 one screen
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-b4-lore-fixes-v2-1-1872d60e13af@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGm4w2oC/3WNwQ6CMBBEf4Xs2TVtoSCc/A/DgcIia5CaFomE9
 N8tePY4M29mNvDkmDxUyQaOFvZspyjUKYF2aKY7IXdRgxIqF6XSaDIcrSPs+UMeU6k7Tfoiyya
 F2Hk5OoJYuYHJoP55/m0e1M770E4N7Gfr1uN0kQf7Z3+RKFCKtO9KLQrKi6tp1pGNo3Nrn1CHE
 L5IqQlmwwAAAA==
X-Change-ID: 20260925-b4-lore-fixes-315d5e5819a3
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

view_in_pager() strips F from LESS so the pager stays open on output
that fits one screen, but a core.pager of "less -FRSX" carries the flag
on the command line, so short output still flashed past.  less(1) says:

    The environment variable is parsed before the command line, so
    command line options override the LESS environment variable.  If an
    option appears in the LESS variable, it can be reset to its default
    value on the command line by beginning the command line option with
    "-+".

So append -+F to the command line when the pager is less.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
I'm using b4 in other projects and this allows me to catch some issues.

v1 had three independent fixes and the first two are applied, so this is
the one that is left.  view_in_pager() stripped F from LESS so the pager
stays open on output that fits one screen, but a core.pager of
"less -FRSX" carries the flag on the command line, where it beats the
environment.  It was causing TUI range-diff issues on my end.
---
Changes in v2:
- Dropped patches 1 and 2, which are applied.
- Reduced to one change: append -+F when the pager is less.
- Fix the ci.sh issue by importing subprocess directly
- Link to v1: https://patch.msgid.link/20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com

To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 src/b4/__init__.py         |  5 ++++-
 src/tests/test___init__.py | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index c482f46471e4..58725eba42df 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -7411,7 +7411,10 @@ def view_in_pager(bdata: bytes, filehint: str = 'b4-view.txt') -> None:
         else:
             sp = shlex.shlex(pager, posix=True)
             sp.whitespace_split = True
-            cmdargs = list(sp) + [temp_fpath]
+            cmdargs = list(sp)
+            if cmdargs and os.path.basename(cmdargs[0]) == 'less':
+                cmdargs.append('-+F')
+            cmdargs.append(temp_fpath)
             logger.debug('Running %s', ' '.join(cmdargs))
             spop = subprocess.Popen(cmdargs, env=env)
         spop.wait()
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 96bea894a2d0..fe2dfb35a9e6 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -10,6 +10,7 @@ import os
 import pathlib
 import smtplib
 import socket
+import subprocess
 import sys
 from typing import Any, Callable, Dict, List, Literal, Optional, Set, Tuple, Union
 
@@ -2503,6 +2504,61 @@ def test_git_head_restore_args_round_trip(gitdir: str) -> None:
     assert b4.git_head_restore_args(gitdir) == restore
 
 
+class TestViewInPagerLessFlags:
+    """A less pager is told -+F, so short output does not flash past.
+
+    view_in_pager() strips F from LESS, but a core.pager such as
+    "less -FRSX" carries it on the command line, which less parses after
+    LESS.  A trailing -+F resets it there, and is a no-op where F is unset.
+    """
+
+    class _Spawned:
+        """Stands in for the pager process."""
+
+        def wait(self) -> int:
+            return 0
+
+    @classmethod
+    def _argv(cls, monkeypatch: pytest.MonkeyPatch, pager: str) -> List[str]:
+        """Return the argv view_in_pager() would run, minus the file."""
+        seen: List[List[str]] = list()
+        real_popen = subprocess.Popen
+
+        def fake_popen(args: Any, **kwargs: Any) -> Any:
+            # b4 reads its config through Popen too; those calls capture
+            # stdout, the pager's does not.
+            if kwargs.get('stdout') is not None:
+                return real_popen(args, **kwargs)
+            seen.append(list(args))
+            return cls._Spawned()
+
+        monkeypatch.setenv('GIT_PAGER', pager)
+        monkeypatch.setattr(subprocess, 'Popen', fake_popen)
+        b4.view_in_pager(b'short enough to fit one screen\n')
+        assert len(seen) == 1
+        assert seen[0][-1].endswith('b4-view.txt')
+        return seen[0][:-1]
+
+    @pytest.mark.parametrize(
+        'pager,expected',
+        [
+            ('less -FRSX', ['less', '-FRSX', '-+F']),
+            ('less', ['less', '-+F']),
+            ('/usr/bin/less -F', ['/usr/bin/less', '-F', '-+F']),
+            # Only less is told.
+            ('most -F', ['most', '-F']),
+        ],
+    )
+    def test_less_is_told_to_reset_f(
+        self,
+        gitdir: str,
+        monkeypatch: pytest.MonkeyPatch,
+        pager: str,
+        expected: List[str],
+    ) -> None:
+        assert self._argv(monkeypatch, pager) == expected
+
+
 class TestUnicodeControlChars:
     """The Cf-character guard in get_am_message() must raise BadCharsError
     instead of calling sys.exit(), so that interactive front-ends (the

---
base-commit: fde280870f9a212df1317b35df19e80bfda32a57
change-id: 20260925-b4-lore-fixes-315d5e5819a3

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>

