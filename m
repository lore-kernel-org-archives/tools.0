Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469A481255
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340635; cv=pass; b=HHJ1GA+C2GJIzz6fw/5HBaXzUhUQN/NQbWjy/PIPKf2R/hRw4qJV8JiFQRpCahnJrGMuY8Iw66LAzkqyAtuER96At0QF7Uafji/6aMj+FsvnCBtdRQwzoOy+CeqCeGqPCi9nY2bw9t8usKzSY2Swez8jAfy8EkFu4qzXgaqDG0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340635; c=relaxed/simple;
	bh=6mK5oHvrsVLv1uv3rqMsDWvyVCueceKhCgOGWK4iKDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NL/E2LQXTeFIbN/LMEytNKoz27toyvapCrVAQNdjAGVlB3ohZRqQ1tlq37KuoyGgDyuTkDipB+rghFlaWlR8hyKwspwzYDew1R24wcVpcZLaYLBSo/HXNGdvdjAwWkNFMz/KyRUuj+o/xdB+iaARxu+YCOYMjVeqiyXa4zSb78E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LGvTvYkW; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LGvTvYkW"
Received: by smtp.kernel.org (Postfix)
	id EC03D1F000FF; Fri, 25 Sep 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.141
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790340633;
	b=fp3K/2mi0VGs4YpVZ2i0fHYcemxqjInbwC1hki7NGK2PsC6KZEoX6k/c2/mZCQs/cNMl
	 qVD6U6fsHYcmlDmp2+chp1ya5Ge5nIB/0lZBjFR6yXroqjEowQayBG2a+imJ1PqEQ+zhB
	 qXQ0HJvSobh6knSuvlpCBT5kXKgmdlK8BzCfQQS2HQTLoAUjv61y4HT02Z5GzRXPND8Ag
	 LNJWQ3m4v4Zu0mnhFJAqE3594a9islrcp1pZXjiao6THR6u6kP4l8FZ1qLOAB2YzbfY6y
	 IofvMxKaHrsJEXBuJk7/QpkWd5Q6GE3MJwhNu8jmL4eIQgXNIMK2FY/U64PxHsSCPTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790340633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DC+2JEtFnHfVAXzGkx+30ijTPXn77ZruStxxf+9ADPE=;
	b=GoUuRey+1MMVWNs44VKX5JifLDooy5t8IX1VOixwbx+REX5BS3lHa+3CFpfthrRn+TOo
	 9sIdu/v1WtAS+bs62xdPO94smggNdMHLw2IaOjLSiTumjuAeHhcOoHroBAe8iJSEHA/aY
	 fddA4NsAYS/H1/sO3IUdVMLuKspcQ9vxA0wnuPwr1Jg9R4pgZtwj1HuRy6boMHjTQRw1e
	 2U3xcx92IeX8X+evKfRl+HtggJX2PVva8rD+BELjTCbGTsT/hzI3JbugxfNWtCvXnpAPQ
	 ryrjn6m6Equb3dYWO19o1tenPifcYuGzn/6b55PcAGcMn20nYFJcJaEeWrTb6tjN8kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LGvTvYkW;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.141
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29FE71F00893
	for <tools@kernel.org>; Fri, 25 Sep 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LGvTvYkW
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 29FE71F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so8784985e9.0
        for <tools@kernel.org>; Fri, 25 Sep 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790340632; x=1790945432; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DC+2JEtFnHfVAXzGkx+30ijTPXn77ZruStxxf+9ADPE=;
        b=LGvTvYkWFApXAxzfv4vj5jKyzOb9gerjPydQr7FkkruDJkVVpb8y0Q6UvbLhM7dbet
         d4c7Y3XTZ6Wc2Aue1wZWCS/QpmwB6a7ptP/6nFcO8qFYwhfD9Cjl64U/gFYCVAnrBgJI
         GnG0QblrKj76KLG5sM1LyxivJz632lMu8ixOt6Becb73b5f4xLnfPqj5YKbnYe284cze
         SnPiYRgbsDU1EYgNAKH1XjdwuS0X3SBJL9cW1/VmWpS+oOcoK/c0ryX1FRJigGmiU2gf
         FQvbJoRSxbRUiAAfYS79v3wpZTTKyWU+KYceOtgjU/bDsw7RL006EjBSePAMrAjerDL/
         43dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340632; x=1790945432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DC+2JEtFnHfVAXzGkx+30ijTPXn77ZruStxxf+9ADPE=;
        b=qT+dGb+5hqjhvTrcgB/72U1Tr42ScRSi8Of7jbmg51KJulh4dFkzQWJLY0+vAa7o4w
         77yeK9G2oPib43+NVRaiUDbgsYmW90JgDbfPeo53cJR80k6KOXlZL3W+HLl8RwQ5jO9z
         eLQk4oD3ATm1/W0RK7VYJw4iHqg6SHjKOXC50ADmfhOZCo5RV6N5V92p0GSEN09Y0AU5
         6fmrfUyKxlF7iHF9RHDlcgoXz74zwRKUTN/xLUcx8rpYplzvCyxBjLsZnnHu09wDaBdi
         yl76J3Fi9trrHKqphiV4aMv4Pl5teXPMbq8M7LL3Bf+kS9fW0DzNw/W5uBjxQsPQ/+Rg
         CDQg==
X-Gm-Message-State: AFuF++mOz6hDmTeKYgZOU51dJwGUK/7izwQZW0MO+Teo1ObmVNpwKQGD
	7r7B2KnQtCimyNTaci8pCkX8QhnhLgj9YHa3Z0VWWXGe4AK47DzFONKLiiPjs/O4AOQ=
X-Gm-Gg: AYBFou28bHcwRA4Xia9dJwDEOraLkOlJJBBo/ipPXDGIZHCS7vaZg/vF4T5K+k11Reb
	zQdc+oVb6j90oWTV+ekwVP1oB1No9fP2J++S1McQ3rtXwJK2Sw/63vu3x6StxFxVgaGXQWudl6t
	ippr+U+fPPri8m7zoO2BUIMiUa0+CPEPlB0wDeKFU1ibUrKigSnAlCt1grQD+gAaVMMZTo+dpDk
	1H7rgq9KMPggzCHxIazf1+hJzLveMd+KAHOkq8n7fUnQoES+8gL8+8NAK5J7NHwZZ+rscTindpl
	gijiePfz0EmU2XeRku2xctQmgkc/ykiLbjXJHrjBUutmDuJKdCEMpbJcqucxP1Nke4odPz27bmW
	9fwVS3ITK700Wj597MOE/FFzQvPRhwPTFmoPmVt6khJSUlrJSI6Yex+6FwgzvjafWPwpulcAn8y
	yihPCWw9Sbzm+g/46TEbgJFmhQw05+dd5VdoVYcd9C45HRTDvcnf+rREbnbUgmQEQrKps/f5cHw
	K/qqvUMLVW8fHimi4aP
X-Received: by 2002:a05:600c:34d4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49fe66d1279mr89995815e9.10.1790340631679;
        Fri, 25 Sep 2026 05:50:31 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm234355145e9.12.2026.09.25.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:50:31 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 25 Sep 2026 14:50:28 +0200
Subject: [PATCH b4 3/3] lore: stop a less pager quitting on output that
 fits one screen
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-b4-lore-fixes-v1-3-103fd9507e67@baylibre.com>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
In-Reply-To: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

view_in_pager() stripped F from LESS so the pager stays open on output
that fits one screen, but a core.pager of "less -FRSX" carries the flag
on the command line, where it beats the environment.  Anything b4 hands
the pager that is short enough to fit then flashed past and was gone
with the pager, which is the one case the stripping exists to prevent.

Append -+F instead when the pager is less: it reads its options left to
right and -+X resets one to its default, so this reaches the flag
whichever set it and however it was spelled, including the long
--quit-if-one-screen.  The environment is left to the pipeline case,
where the less inside "diff-highlight | less -RFX" is out of reach and
an -F written there still wins, as it did before.

Assisted-by: claude-fable-5
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 src/b4/__init__.py         | 18 ++++++-----
 src/tests/test___init__.py | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index f55e9d9e73aa..97caf4c8a00f 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6783,24 +6783,28 @@ def view_in_pager(bdata: bytes, filehint: str = 'b4-view.txt') -> None:
         with open(temp_fpath, 'xb') as view_file:
             view_file.write(bdata)
 
-        # Strip -F (quit-if-one-screen) from LESS so the pager always
-        # stays open, even when the output fits on a single screen.
-        env = dict(os.environ)
-        env['LESS'] = env.get('LESS', 'FRX').replace('F', '')
         if '|' in pager:
             # Pager uses a pipeline (e.g. "diff-highlight | less -RFX"),
             # so we must use the shell to interpret it.  Feed data on
             # stdin since piped pagers read from the pipe, not from a
-            # file argument.
+            # file argument.  The less inside is out of reach, so F only
+            # comes off the environment here.
+            env = dict(os.environ)
+            env['LESS'] = env.get('LESS', 'FRX').replace('F', '')
             logger.debug('Running (shell): %s < %s', pager, temp_fpath)
             with open(temp_fpath, 'rb') as fh:
                 spop = subprocess.Popen(pager, shell=True, stdin=fh, env=env)
         else:
             sp = shlex.shlex(pager, posix=True)
             sp.whitespace_split = True
-            cmdargs = list(sp) + [temp_fpath]
+            cmdargs = list(sp)
+            if cmdargs and os.path.basename(cmdargs[0]) == 'less':
+                # less takes its options left to right, so -+F resets
+                # quit-if-one-screen whichever set it.
+                cmdargs.append('-+F')
+            cmdargs += [temp_fpath]
             logger.debug('Running %s', ' '.join(cmdargs))
-            spop = subprocess.Popen(cmdargs, env=env)
+            spop = subprocess.Popen(cmdargs)
         spop.wait()
 
 
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 18de9ab0f114..d253af11a86c 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1981,3 +1981,81 @@ class TestFakeAmGitlinkPreimage:
             ecode, entry = b4.git_run_command(repo, ['ls-tree', commit, 'sub'])
             assert ecode == 0
             assert entry.split()[:3] == ['160000', 'commit', gitlink]
+
+
+class TestViewInPagerLessFlags:
+    """-F has to come off a "less" pager, and nothing else may change.
+
+    Output short enough to fit one screen -- a range-diff narrowed to a
+    single patch, say -- is exactly what quit-if-one-screen flashes past
+    the reader, and a core.pager of "less -FRSX" carries that flag where
+    the LESS environment cannot reach it.  less reads its options left to
+    right, so appending -+F resets it whatever spelling the pager used,
+    and nothing in the pager's own arguments is parsed or rewritten.
+    """
+
+    class _Spawned:
+        """Stands in for the pager process, which nobody is here to read."""
+
+        def wait(self) -> int:
+            return 0
+
+    @classmethod
+    def _spawned(cls, monkeypatch: pytest.MonkeyPatch, pager: str) -> List[str]:
+        """Return the argv view_in_pager() would have run."""
+        seen: List[Any] = list()
+        real_popen = b4.subprocess.Popen
+
+        def fake_popen(args: Any, **kwargs: Any) -> Any:
+            # b4 reads its config through Popen too, and those calls are the
+            # ones capturing stdout; the pager's own goes to the terminal.
+            if kwargs.get('stdout') is not None:
+                return real_popen(args, **kwargs)
+            seen.append(args)
+            return cls._Spawned()
+
+        monkeypatch.setenv('GIT_PAGER', pager)
+        monkeypatch.setattr(b4.subprocess, 'Popen', fake_popen)
+        b4.view_in_pager(b'short enough to fit one screen\n')
+        assert len(seen) == 1
+        argv = seen[0]
+        assert isinstance(argv, list)
+        assert argv[-1].endswith('b4-view.txt')
+        return [str(arg) for arg in argv[:-1]]
+
+    @pytest.mark.parametrize(
+        'pager,expected',
+        [
+            # A bundled cluster, on its own, and spelled out,
+            ('less -FRSX', ['less', '-FRSX', '-+F']),
+            ('less -F', ['less', '-F', '-+F']),
+            ('less -R -F -X', ['less', '-R', '-F', '-X', '-+F']),
+            ('/usr/bin/less -FRX', ['/usr/bin/less', '-FRX', '-+F']),
+            # the long form, which no amount of letter-splitting reaches,
+            (
+                'less --quit-if-one-screen',
+                ['less', '--quit-if-one-screen', '-+F'],
+            ),
+            # and a pager with no -F at all: -+F is a no-op there.
+            ('less -R', ['less', '-R', '-+F']),
+            # Only less is ours to touch,
+            ('most -F', ['most', '-F']),
+            # and its own arguments are left exactly as written: a prompt
+            # string whose text happens to contain an F,
+            ('less -R "-PsFile %f"', ['less', '-R', '-PsFile %f', '-+F']),
+            # a log file to write,
+            ('less -oFramelog.txt', ['less', '-oFramelog.txt', '-+F']),
+            # the pattern to open at,
+            ('less -pFoo', ['less', '-pFoo', '-+F']),
+            # and "+F" as the command to start with.
+            ('less +F', ['less', '+F', '-+F']),
+        ],
+    )
+    def test_less_is_told_to_reset_f(
+        self,
+        gitdir: str,
+        monkeypatch: pytest.MonkeyPatch,
+        pager: str,
+        expected: List[str],
+    ) -> None:
+        assert self._spawned(monkeypatch, pager) == expected

-- 
2.55.0

