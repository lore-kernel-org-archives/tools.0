Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1BE1107
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 01:29:44 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d5so6357446qtn.13
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 17:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECAfv659uYWQnO2h/PsxdeMwtxCieH1klKtjer9/xXw=;
        b=lM+HEd8SjWj4z8EsCqL71qXsyEAxdYthqaZ3gUyTaFybksuzLFAu+ghTLDaPUSIlOw
         L9XBGiPMLsBiMIo7YrS8qDYOy/nTAZKD5RoCUp5ua4HA9C7LgL/RSLHV6KS2Y2LfyNPB
         pvRxlPSGjEZyk3xrTaW2vP9TJK04wtT2EXlVuGHXACDZJu4MbiULN3AUJ7g+iC/HvB03
         FGkAuNEsOZhJ30TcaCRn1edJV4927qr3P/Eu5QRkESOFYk84SlZNUe3U+mjmV/Q882aS
         +1cIfS6W+DszpC25YMq6zvF8zuiees6aaJ8DaDEpWa9lmD64YqcGIi93L8Ybz8GTAGsX
         HzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECAfv659uYWQnO2h/PsxdeMwtxCieH1klKtjer9/xXw=;
        b=AnTO9XU+n3IW7CPtwgH0bxSnL0B4aq3OlighdZ5a4vZlKt0QVPIW+vjg4bdNk0nlBy
         whvt8aezz9rxSj20jTNZcTwEOxCS6QzJ5hp0FPE0644AjAHy7YmLoxEL/j340uxDGxjt
         OekoWY3SzDqgdMWQvdMPUYgVS/IWgSMx5DG3F+eLhPpl1BtcihtVnpFO2188BUBtoRn6
         XgDMup0Qbmts1l9juzRldjz4krvzjqSHDvS5obKoIzRt4kI/3NrMhQ9AJ0arWdM45E8o
         S/TFnn4lQKreSmfiTjMrOs7JHjx9Qc1vRmQ7zTLxJWTSoO6ouYRZmUilCwmR1CAcNuFQ
         4Igg==
X-Gm-Message-State: AO0yUKUkHbukAUjlEnHL17NKmj5+uSUk4CKl57Z+4sn+SUVeyQtkbyOE
	JQqud4y6/oczRP4aCp+PaXxSNtfjkrc=
X-Google-Smtp-Source: AK7set/PRuXAJLcXkxcy6WtOpOuR+nI1EVdfIDX6U/hxkgUtsGyBJ20/ybBUgXkTWFZGjFunmevJyw==
X-Received: by 2002:a05:622a:5d1:b0:3b9:b1ea:2d0f with SMTP id d17-20020a05622a05d100b003b9b1ea2d0fmr11230279qtb.34.1677029383760;
        Tue, 21 Feb 2023 17:29:43 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor135.cmc.ec.gc.ca. [205.211.133.135])
        by smtp.gmail.com with ESMTPSA id o190-20020a375ac7000000b0073b45004754sm11872357qkb.34.2023.02.21.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 17:29:42 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: [PATCH b4 0/3] ez: allow sending all versions of a patch series in
 the same thread
Date: Tue, 21 Feb 2023 20:29:16 -0500
Message-Id: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOxv9WMC/x2OMQ7CMAwAv1J5xiJNy1C+ghicxBAPCVUcEFLVv
 +MynnQ63QbKTVjhOmzQ+CMqr2owngaImeqTUZIxeOcn58cFlWtC6dyom6ooFZUKY8+NKWG8OJp
 CnDktDBYJpIyhUY35yLxX7eaVcyG1xmGsjR/y/S/cIMxw3/cfzkxx3pYAAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.13-dev-696ff

Sending a new iteration of a series in the same thread as the previous
one is the preferred workflow on some lists, the Git mailing list being
an example [1].

This series allows that workflow in b4 by adding a '--same-thread'
option to 'b4 send', with an associated config option.

Cheers,

Philippe.

[1] https://git-scm.com/docs/MyFirstContribution#v2-git-send-email

---
Philippe Blain (3):
      ez: allow iterations to be sent in a single thread
      ez: add '--same-thread' option to 'b4 send'
      ez: add 'b4.send-same-thread' config for 'b4 send --same-thread'

 b4/command.py             |  2 ++
 b4/ez.py                  | 14 ++++++++++++--
 docs/config.rst           |  4 ++++
 docs/contributor/send.rst |  5 +++++
 4 files changed, 23 insertions(+), 2 deletions(-)
---
base-commit: a3281834d6d5dec44f58071fca2d22e04a97fe18
change-id: 20230219-send-iterations-in-same-thread-c50a3bc4ed9e
--
b4 

