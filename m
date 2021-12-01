Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E59A2C9D
	for <tools@linux.kernel.org>; Wed,  1 Dec 2021 00:11:29 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so19567046pju.3
        for <tools@linux.kernel.org>; Tue, 30 Nov 2021 16:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkuVU66hyH11vnmSkfl5CEnCNwK4vK1mOFl16Y3N+LM=;
        b=M/W98Dbp8+oCs5k+s/HvUETVDnwrqago4m25MeaK+soVWpDxr4g8/F/cTefz0X8+S6
         UbR414d8JFlJFm+irPBrX6movezgMBbmWTLi13NjNIda4DTo9Us/XYe9LAVhkXv1NPM+
         VuDn6IJ4I4UJzX6bCeijJNY1GcAljmg0uVVB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZkuVU66hyH11vnmSkfl5CEnCNwK4vK1mOFl16Y3N+LM=;
        b=J5di3+qKPJVpDU7b8Muu9ORxNHSnrnGc9uKiVOQZStG4dg49giimkQCyLnKbRIp+EQ
         a1jMh+Dv/TAM8pfljEEfKAf3DVVHxrfTCTFxD6H+IDYz+n+K6Xl/+2EwnPIMCeqjCBbj
         dLnLXWQzRDQQJtK4Np9PoOtuCm01cV/nZskHUDlViRdRhgwVgNijvjGrH891Mbmrbr2y
         66qN0CcwEAhu4trS1WWwm8wLMBzOuidNMfWTS8VVGShTtBWy/gtvJY+rW455noA856dg
         rSjiKGzbIQ3FqXZ+an5SeNA9YSQIcOMd6/s0knhKkdJTjZ0zvlIg8YkOJwCTCTYTqz26
         YkvA==
X-Gm-Message-State: AOAM530kJHsqNRuZ4kOCl81ZpXTF+nMb/YtuZR4QxdnDWPbul/CNYjCt
	GQTheTX/EMYY6VlvR2yYOuHKjoOwiKaDRw==
X-Google-Smtp-Source: ABdhPJxt1BkjYf9nHigRwTEnD+jN3fT7KEzlA8naj5FxHX6gWb+4WE0x4Ho0OUyASTDYPoH3uOH3mw==
X-Received: by 2002:a17:903:11cd:b0:143:d220:fddb with SMTP id q13-20020a17090311cd00b00143d220fddbmr3132945plh.5.1638317488881;
        Tue, 30 Nov 2021 16:11:28 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u22sm24032852pfk.148.2021.11.30.16.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 16:11:27 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 0/5] patchwork-bot: Use worktrees for repos
Date: Tue, 30 Nov 2021 16:11:21 -0800
Message-Id: <20211201001126.4106635-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=716; h=from:subject; bh=EZfVBPSemhrZ2bKED1OqZqFRIe6heoxfih6QgqA+NOg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhpr2s4k3STxnPIY2VYbqjpsqyYlistE5mklX+Hlti dZoZ712JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYaa9rAAKCRCJcvTf3G3AJvKrD/ 0XM4kHK9qiD2V8eBhwbzcfSjB19dSOJtxwmJtOGrKiLMmq8alVNeHz4/CApDeq77Mhe4nH8pZ2OcJh P/MLy0BJia/qI/NzLDD2VA06U3tQl/LMoG4Uf30H9OSgYTBmQy7ePy5e77veb2rPc5stm8X0RyNyIy Tyr2Ktn6NStqzXjeYr0W9alJv9iHZfaZ5yOdg9tkv/ivSnhi7UKGePnqytT7EILDUHWfE1T/fqSyDD kauKTwMDplXKk5KR9g6T8FcpvNkWSZCz/QdRSJnDr8Iy6sHKnK8V70H57LO6KgdBoHfOO+wDmEXwk0 sbn4JDUXuSUA9d8m2f44fx8vPsLFyTBVmKkIbyfQdHxb5yVMCgHMO5/WHVPFgfAgqpVQ1s+k7kqAw3 zA8RnIeIuz+16F9YyTaW8t8zpGcOUeJBMMZrMVDEk8zw6J7Jg/RdPdJCrhHwzhZw5xjT35P+myYcrG 4XU8bC9fm2EE0dJtSRpNmqR2F/+dgDaeaJH+Xx8qVlH5/v8iUZC5pHPz4ajLlFVNUa8xQPl8JW6XK+ HJQHZW8+N44xttaK9nUsCh0Q0zy77/a3MJmXRcS2X+oqF2OOjY8O40gQEIB0GNQWMInt1yDYBZhhSG dUvv+BG0SBQYgP44XYlI+qi2N/uRYGuHPcq1EynrMDfw58J/Z6j2SS8FWXSQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

To use patchwork-bot locally, I wanted to use my existing worktrees for
various repos. This makes a few small improvements and then adds logic
to deal with specifying branchs and operating in worktrees.

Thanks!

-Kees

Kees Cook (5):
  patchwork-bot: Note which actions are part of "housekeeping"
  patchwork-bot: Create CACHEDIR if it is missing
  patchwork-bot: Allow limiting heads to single branch
  patchwork-bot: Handle repo being a worktree
  patchwork-bot: Allow initial database to skip recent commits

 git-patchwork-bot.example.yaml |  3 ++
 git-patchwork-bot.py           | 50 ++++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 8 deletions(-)

-- 
2.30.2

