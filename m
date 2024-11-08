Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8EF1EB21
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069146; cv=none; b=cZ8B6ZWBsTuzT2+5bOtKpt2yZgpyP16vHc9ciFb8m45Pj0NCkvQI9A7F+bDArY1sRZuizIvW7zM5eWPVBXJ/k6k1+wM48r4uhUXkse+n9PaCjeGj64NvzHPBELdzvrfLfG/r4fA1o0XygT2LcXc/iGSvXNtjjdgFzUOX9J6rXX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069146; c=relaxed/simple;
	bh=PtUcCOXZm9iGayo3Ub3JeRCCo1ok4WdAydn9Fv8lLS0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TOabUTcHsaW13HZ7FFFDahXkuCHnQyU6BBVxgYdg8/VS9lOdDaVIPab1VTkkPiTGZ0J+TDgexyk/cT3HI+9hSaqVo0oUCstkW1Nnyyjr5AHBZHctqE1sRzgcgxbVeIBnqorPu13FwtEYP+mLnGHREXMbNbDqvNCsxTyGherJG1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkzjeXL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkzjeXL3"
Received: by smtp.kernel.org (Postfix)
	id 574B6C4CECE; Fri,  8 Nov 2024 12:32:25 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60E03C4CECD
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60E03C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b15d7b7a32so144864285a.1
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731069143; x=1731673943; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hAm9hW9mpxnAwwKpfs2aWgsNfLXA/ssong8tML2EXf4=;
        b=fkzjeXL3ti95Q6FkB2bsIFtBihxOG6FmgmDfw5hfbHKC1ZdY6jH0a2Ij2FH4RApNxh
         LPbjQH3laYE3CY3rtemXK17A1lk5jm4VhMiDJjhltydzr+bcZV/FLK9kBorXMwtHzNNo
         HCe916rLjYowPpSCO/FYOM3dWLPUMb75r8A6QTvN/u5cIf/LftunPjF7q/xsMGilULNR
         ZhY/ox/jVEJN40Ml5IkjFBNf5dJMjLphYMR7Lvf6bhWub1paAMZU9Ooi/eFQ75bjgjm5
         /JTC/D3g4ckVAb8ippXqFUS4+5QKiZ6fpfRzHzvQrhwRcajXDD94qVQ4B/e4Dar+VYsh
         nUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069143; x=1731673943;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAm9hW9mpxnAwwKpfs2aWgsNfLXA/ssong8tML2EXf4=;
        b=cRYzxRqxJ3D5xMNRnzzjc1RD26Jn6r3vkh/rZ9yesQ5802+Q7xqZjK/jYQIwtaphM/
         9l1sh2grBm+l72UijGswggL6ZKauXR5hTGAe9qkBp1pMo7Uynb5lMJ1f+moPzUwAshER
         +BXzm4GqUwUNVMBNITUDnE2HxwY96euJnN+hdiPf6x7cmFJC8rqOyJXpdNinK6mx7Gsx
         8nkHEkKaWdZpF9knWiaHLqpAtA09X4kZ6E1IhHX4Vii3z/Z769QUiv+VmxRZ6Mdl+5QX
         DUbRhys135dnn3DtOyYWQCL8X/HrB17RJONxP5fd7CFiUfRiR0T1/L1dm/5xJdfQl+I7
         AL4w==
X-Gm-Message-State: AOJu0YwYbP5ezvSCrw2GffXoxJszaAlJaUgB8WGmQwKySczJYdkCTPjL
	XYm8gTqshF9qmYt1mP036Eqo5Yky0getUTFM01e2M0ljL6IzXgqL
X-Google-Smtp-Source: AGHT+IFTV/x8l4AGzgHEuKVbkhB2dphd1zNUxE9ep3ZqiWPit9rcNbaXarmWKARWJnnd3aXzQ+DUTg==
X-Received: by 2002:a05:6214:450a:b0:6cb:f87f:f2da with SMTP id 6a1803df08f44-6d39e161ba1mr33169696d6.26.1731069142975;
        Fri, 08 Nov 2024 04:32:22 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:348d:4cbf:ba75:f557])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef48csm18633436d6.35.2024.11.08.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:32:22 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [b4 PATCH RESEND 0/5] Resolve some static typing errors
Date: Fri, 08 Nov 2024 07:31:27 -0500
Message-Id: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This series slightly improves the quality of type annotations in the
project. It also adds development dependencies so they can more easily
be installed.

Unfortunately this is only a drop in the bucket; there are still 356
errors as reported by pyright. Without minimal tooling to ensure these
don't gress, progress will be difficult.

I'd be happy to contribute such tooling, but I didn't find where to put
it - there's no obvious place from which tests are run, for example.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (5):
      Add development dependencies
      Avoid file descriptor leak
      Correctly type annotate generators
      Provide overloads for git_run_command
      Add missing imports

 pyproject.toml             |  8 ++++++-
 src/b4/__init__.py         | 52 ++++++++++++++++++++++++++++++----------------
 src/b4/diff.py             |  7 ++++---
 src/b4/ez.py               |  2 ++
 src/b4/pr.py               |  2 ++
 src/b4/ty.py               |  1 +
 src/tests/test___init__.py |  1 +
 7 files changed, 51 insertions(+), 22 deletions(-)
---
base-commit: 2a6338e451a0c1e81f214f48c820c1e52d76b2f1
change-id: 20241025-better-type-annotations-e732fbdb2ff5

Best regards,
-----BEGIN SSH SIGNATURE-----
U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7h
JgsMRt+XVZTrIzMVIAAAADZ2l0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5
AAAAQDyp0EuH8MRQJAmLtKb9/nsjczbFhwM2g0XcY70EEkGF87t28QCADDPBXv4SIqesgc
b8/3E18A09Qv9cHgcldw8=
-----END SSH SIGNATURE-----
-- 
Tamir Duberstein <tamird@gmail.com>

