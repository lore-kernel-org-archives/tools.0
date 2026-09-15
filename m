Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D129A9C3
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434244; cv=pass; b=WZYQX798xdfSDrzEYFSQQi1oSJX4bviU8FGCUfDhKum/Qw1TDFnwJcfy6KG2GfEHcxymMt9FaXmgSOUKFFcqT0fmowHBLUx83XdPpp1p+etgcgu9vVeTBro40oeH7zNI5AgPHkcn0IImThI0wFd3u0fYnjv0A5jBAQJWoVF9vnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434244; c=relaxed/simple;
	bh=xae7+oXjN1qUUe0qZ6/HaTYfgbSB4qlCSig2T06qt6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z1HUk79rKYdt4fqZss38PVveL6d2Iv1cXEvkMIdZChExZL9G7UScb6IplxhpszyLZ/zwJNbPJu2GXtxnDJsV61emngWLObXd6gaNX2XJYyIk+jzTLI+oqa6R9K7K0wm6N6ztrcBUcPce1ON3ya1cxuSnzbbKxryMBkit2E3O6WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=A0IiHBYm; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="A0IiHBYm"
Received: by smtp.kernel.org (Postfix)
	id AF3471F00893; Tue, 15 Sep 2026 01:04:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.231.169
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789434243;
	b=BJHupJIq3fta1AjLqil6ayl4rkQ7VcQP5WW0Ej7dyTQfr/LGbfdH+aYFwC5MHjBvH9v/
	 zGlKSIAU0zFcMk9lmH86ASt2A3g2thAHhhyqgC+KEvKV7aslXh1nsJ26hCOF7FQj4WaCW
	 GNZvoIl0N+Gf5Jee0JWAB+Ve1TEpINLetG1h2LfG5M4ID5y5q/se3rNMSezwzRX0yb9A4
	 /hEJa25o0wLFKX8jaOhnHQ2ATl1FhE6ebMpYdQ9tP7VDI6HwaWHwMIPzkVh08jzM9a17O
	 4cevCNXGukeaWEwiekWybBY3kLulwVBA0DCNEpPDl0QZi1t3Ogyicgwg+2ZV1aq2M+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789434243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Frpw4AFdMXJ8AosshbFw3dN6bUDodsTYEAEpTTC5qwQ=;
	b=c6lkWPQJuQWSgy9ef1XCFOqvyDY48I7C+lckX//gNZ9XG2BuRQJZtXuwbh06xElr2Q4V
	 519FmC5b3T2w5OsDRq9F0obh9iAH4hTRa4mPnh0HMHEttYhGhtKQuETXM+k9G3qBwXJzG
	 9JqCgClfZmlaexcE2iRCKoCll2WgStrhApu6CfwZyTH8TP8U28UpcCTO/E0jKf9P/O1uu
	 3m+uq12oM/IygjVavZH+Qu0Xv7zQrPj/cOGoErDNCzDmj4Rdp7l0SoN9vmW58F+ZvQDV0
	 CHxe6KcSd+mRMUcg9B39ulz2AGvDKll3BjihXPCCw/VlhWjH/QD4MGYucakljGOd16A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=A0IiHBYm;
	dmarc=pass header.from=brighamcampbell.com;
	spf=pass smtp.mailfrom=brighamcampbell.com;
	arc=none smtp.remote-ip=74.125.231.169
Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18ABC1F000FF
	for <tools@kernel.org>; Tue, 15 Sep 2026 01:04:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.a=rsa-sha256 header.s=google header.b=A0IiHBYm
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 18ABC1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so1280730eaf.2
        for <tools@kernel.org>; Mon, 14 Sep 2026 18:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1789434242; x=1790039042; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frpw4AFdMXJ8AosshbFw3dN6bUDodsTYEAEpTTC5qwQ=;
        b=A0IiHBYmjPax9cJxdSF2PGDw3O9fUPGGqNHD4sdFvWzudCzIMzJ4N4b4PNpN1oN61n
         rYedRYL6HDoTb2SF+RIM+MX5mnUtgJHb2JSLSpkueDoWgL+y/TkHHoNaRhmqO5hN/8tf
         Tulla8RIF0BpyCq5inKHn2IEkpKuJlo8816i8MaVl0UHwPBbPQoeOkyCO4W9ErbJU2yX
         g6T46SJnS+2UPXlA41EWUhsB6Gbx8UCpyUxFi+t03x2x4QmhcOrVE6zZoLQVjGW8/ANI
         FZqLtuLwFnKr1hSckBiyR+AtSXEsS1xrxDhHVPDV4SNL4JcQjOlehlVKxsCGQOlUayJt
         hC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434242; x=1790039042;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Frpw4AFdMXJ8AosshbFw3dN6bUDodsTYEAEpTTC5qwQ=;
        b=X9SrZELVqnlzrGiEJW3rj7zEhudKERv/sJPpit4cNCnD4PYDa2RcR9a6QUsfdPNJYy
         PDVGTH3pRhWbSdAZz5c1gMD2PI/sEEemlbqhCmqUiST5flEozKRmXj8CgNyY3CB9eUO9
         rYm+eVFwGC5Tfyhtw5goFGGvkG2Wx7/1cF5zP6iRoeSrq5PVmyUZXAA/DYR6ejUvCWnH
         JoLfXqHpYW+W8XARVyhygPqEdyClojDtjfdJIshhbhGML6eLwA8dq1w79L5I9kVEEGmP
         uoql0HXUhAepfTqUtQ7tjqEeWhwOPn12M66K2Dkkxsw4WURLRgBd8fz4r8nNTxMsq+Q+
         Yyww==
X-Gm-Message-State: AFuF++moBfvy0ws+MMJFrjsHA2zhVgN0gzIVO0SPLMSQksHIzDH8yelf
	uMaqGyee3pKDMtvxM/uo3d7PAb+JJz2U3u2isdQTfsjJQzLeWdBmLdIS61KbWJWQ+IqMBqOPiGA
	ZJC9Q
X-Gm-Gg: AYBFou2ZltmBuE0atRx6bJecAV8k/p0SFTp5knXj0tvW+ooMTNDwYWiHvLy1aoc+e9T
	wplcW6QCg03QZKyJAncn4XkYx4YlLYaEvWbjnCmj9mfrDl+cb42sOv8GPURdSmZvJNrLtKv7Ti6
	uyreh4Vdw8gof5n2bvfjAd7VtLr+MuqxPCXklV9R+KVwZtD+37W4rLtI5PtEXwA560l6y2C2d1H
	plM92WqaNqxy/N6HkYSOc5sG+WlvIRu0vsFPhLSCq4gFpExf4EA2UY0UDBKcuLg6SyajT8cokF2
	OcKrjIexSgRotDSKf8FfWRYBVEhcfl3zOai7w0dcflJgPzZLIsO/jUdLAsVFLuoA9imWaNE/peZ
	TE9sLpYwmT+HqDdBreHJW+8vYNL+KNlWzBnkn5BWEsV2KBritGD8jzJmAidF5uVjUUkUYZDeKYz
	46TmPpYlxbvRztlHma/T2DcA4l0z++jc7QYW2yIzA80CvXCqX0i5rlyQElD6h1NmKFPRklXi8a8
	VURkOpRe+7C/gK1gQFpNUDhJW30U9LvRIARJ7s=
X-Received: by 2002:a05:6820:2685:b0:6c3:ad5f:abe1 with SMTP id 006d021491bc7-6c53fc70fd1mr2870805eaf.21.1789434241717;
        Mon, 14 Sep 2026 18:04:01 -0700 (PDT)
Received: from brighamcampbell.com ([73.3.69.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm32727020eec.17.2026.09.14.18.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:04:00 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
Date: Mon, 14 Sep 2026 19:03:48 -0600
Subject: [PATCH b4] ez: include mbox "From " line in auto-to-cc input
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mbox-from-auto-to-cc-v1-1-fbf0c3fbd460@brighamcampbell.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMBAEf0X2uQdGtKT9FemDiXd6BY0kWgTx3
 5ta2JdZmDmQOConPIsDkT+aNMwZzK2AH7t5YNI+M6qyupcPU9Pkwk4Sw0TdtgbK856sFWdsI8K
 NRVaXyKL7lW3harz+X9rcm/366+E8v5JY3mh8AAAA
X-Change-ID: 20260914-mbox-from-auto-to-cc-88fb185ffe58
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brigham Campbell <me@brighamcampbell.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=me@brighamcampbell.com; h=from:subject:message-id;
 bh=xae7+oXjN1qUUe0qZ6/HaTYfgbSB4qlCSig2T06qt6E=;
 b=owGbwMvMwCUWLsWS0KCyxZPxtFoSQ9aKmfWCpcwaWS8P2e/exXfu3tUDP1x1D6YeTPIwPOwuG
 nDz3O+zHaUsDGJcDLJiiiwqt2apX5xs/ehgBP8EmDmsTCBDGLg4BWAiNqGMDD/78gWyeXy33rq1
 yXLCvXq/nKv77CZkLLlkZdetH/jp9H+G/7H1mbqaGb+5P0if6j/bXK//4NVV7VQPu72ck/Pv3Tq
 ezgYA
X-Developer-Key: i=me@brighamcampbell.com; a=openpgp;
 fpr=24DA9A27D1933BE2C1580F90571A04608024B449

Include the mbox "From " line in the input to the auto-to-cc command.
This reflects the default behavior of the regular `git format-patch &&
git send-email` workflow.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
`contrib/contacts/git-contacts` in git's source repo is one example of a
script which depends on this behavior. Other projects may also depend on
this behavior.

Why does b4 bother formatting patches "by hand" with `git show` and
python's email module at all? `git format-patch` was made to do this and
accepts `--stdout` if we really want to avoid writing the patch to a
file for whatever reason.
---
 src/b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index cf0029c..618abb9 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -4043,7 +4043,7 @@ def auto_to_cc() -> None:
             continue
 
         logger.debug('Collecting from: %s', msg.get('subject'))
-        msgbytes = msg.as_bytes()
+        msgbytes = msg.as_bytes(unixfrom=True)
         for tname, pairs in (
             ('To', get_addresses_from_cmd(tocmd, msgbytes)),
             ('Cc', get_addresses_from_cmd(cccmd, msgbytes)),

---
base-commit: db0b7456d0cd606f397e18fa0c589fc621fa57b5
change-id: 20260914-mbox-from-auto-to-cc-88fb185ffe58

Thanks!
-- 
Brigham Campbell
https://brighamcampbell.com

