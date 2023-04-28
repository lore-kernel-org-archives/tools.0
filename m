Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1409B847B
	for <tools@linux.kernel.org>; Fri, 28 Apr 2023 18:15:14 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-247526f0eceso198696a91.2
        for <tools@linux.kernel.org>; Fri, 28 Apr 2023 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682705713; x=1685297713;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jIOUHXbcTVtdIpgQFeiIecLt4bOvxltICUKZbZ1BUjo=;
        b=ZJyE2iAxhm0G7Qir9+X1a8SPhlOEeW6FTP9jcdDfsKgUr5Opr3NDRCzEGBTorSIY3v
         ySpx04SA4yBnXIVRoDbRcrpQjNwiu5zPfE6IJP8sgktjCHJAfLCul+OASSwppSZOtxhM
         kvlo3THo5ZMSzT5nf+gsjW9pThxsZgZZwE6qtPC8bSva+WNX7f/7fTw8KWAlI/EZ3hhh
         WpyUTyYymIVUcn/sMB4pgqfBQwLnfRfwidS33q0Tjf+Mn85bER+8vNW9cdkrAAL0rCxw
         c3DV0l4dJ31BKHyjdkfswpzi9/PU8f0hpLDMUorcHjeqQhA/cJJw54BdSveD7/r1V7FK
         LXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682705713; x=1685297713;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIOUHXbcTVtdIpgQFeiIecLt4bOvxltICUKZbZ1BUjo=;
        b=iX/tExM2mh7MSwnSx4XUpRyaYZatLyaeifW2ZV+cXmVpPQfB6XhWt/vHMT1ydUOs6e
         K1B/jJK0nNcrUjQhX0DBk73iw52PKLZxMMvCsoIyjz0xUWigvGZOy6+PWMb7WFLUGzIT
         I2HEvmF9PEFXHp7tDgtrHQfQ7o+axHdQ67FUTFZMm+CVAepTmcsfoL8dvifu2yLQkAoV
         OQSmK291zYW7G3F7sfaAFWyXDYxT9RPOztvdzfOZulSN1bAdin0Nm1207Fjtnr5HhZLT
         Er+dEh+wa0gFiVg/Pdi21612EpPd9xq0+g2Xcd9nM1ZUHdpM4Bw76QJLchBMGpIKxLuS
         8RAA==
X-Gm-Message-State: AC+VfDx2AxdM39vQIbwjK9WLZjelhpWodJopmRpStZVgGJi/KCI8P0Gz
	V5urRH5AQd9Pi5NRTyD8ZCgYsYjGOYuScagVUToD+GISu4IsaryZYAbjLQ==
X-Google-Smtp-Source: ACHHUZ5mluhw6m3O04y7Qv/iODktWNdIeR4XsLsv+T5wUk3G63GVLtOMq+Ksjted8y94kXtnu+JjFqaaNk+iaa+9GAE=
X-Received: by 2002:a17:90a:2b4a:b0:246:b2de:f13f with SMTP id
 y10-20020a17090a2b4a00b00246b2def13fmr6294813pjc.24.1682705712794; Fri, 28
 Apr 2023 11:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Apr 2023 11:15:01 -0700
Message-ID: <CAKwvOdnsFk4zV24SDUf1iBYwTT=7eVKRxoKyJYkVnwqw_dbmzw@mail.gmail.com>
Subject: feature request: b4 send should print lore link
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks,
I just sent a patch with b4:

```
$ b4 send
Converted the branch to 1 messages
---
To: Catalin Marinas <catalin.marinas@arm.com>
    Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
    linux-kernel@vger.kernel.org
    Mark Rutland <mark.rutland@arm.com>
    Ard Biesheuvel <ardb@kernel.org>
    Fangrui Song <maskray@google.com>
---
  [PATCH] arm64: kernel: remove SHF_WRITE|SHF_EXECINSTR from .idmap.text
    +Cc: Greg Thelen <gthelen@google.com>
         Nick Desaulniers <ndesaulniers@google.com>
---
Ready to:
  - send the above messages to actual listed recipients
  - with envelope-from: Nick Desaulniers <ndesaulniers@google.com>
  - via SMTP server /usr/bin/sendgmr
  - tag and reroll the series to the next revision

Press Enter to proceed or Ctrl-C to abort
---
Sending via "/usr/bin/sendgmr -i -f ndesaulniers@google.com"
  [PATCH] arm64: kernel: remove SHF_WRITE|SHF_EXECINSTR from .idmap.text
---
Sent 1 messages
Tagging sent/awx-v1
Recording series message-id in cover letter tracking
Created new revision v2
Updating cover letter with templated changelog entries.
Invoking git-filter-repo to update the cover letter.
New history written in 0.08 seconds...
Completely finished after 0.35 seconds.
```
The lore link was
https://lore.kernel.org/all/20230428-awx-v1-1-1f490286ba62@google.com/,
which I found via `git log`. Can the above text be modified to print
that lore link to stdout.

Instead of "Recording series message-id in cover letter tracking"
maybe "Sent to https://lore.kernel.org/all/20230428-awx-v1-1-1f490286ba62@google.com/"
(or in addition)?

That way I could quickly open the link from my terminal. Small request
that's easy to work around, but would speed up my b4 workflow.
-- 
Thanks,
~Nick Desaulniers
