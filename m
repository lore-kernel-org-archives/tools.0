Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C627127
	for <tools@linux.kernel.org>; Thu, 27 Jul 2023 18:47:53 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d087ffcc43cso1224002276.3
        for <tools@linux.kernel.org>; Thu, 27 Jul 2023 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690483673; x=1691088473;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6XvF866ztULgHIPw5eL1RN11YaiqIOMwtk4/chVGttM=;
        b=IFsbIWOe+YRWY5gZE5970W4X5pq7CD2uSCPIGwo0PUFSi/FBhWnNq8ObbxyqECrhcf
         /F1c5B4h7ofaFvZTG5PaTCMkThoGWsrkJ2m5x/85gXkMHzKK3vQ5/BatBFgln20tyYjg
         kien4vKAXExZ4P0Ei+oYJH+CdWB0lZx0meluRlaq6MVNDP94GDkKGnzYvVQjvzbrtb8O
         NwNqXPqxD7r/TbOw2Gok3Ctl0o4vtt72MwUaFLmBAzJmsGdwQ9kGEkb9rvTZydq2fnt+
         gKFqyo6FrdajVKx42BP1QwQfVpZFxHFoEi0kEvGNUK8MKu0xyz3FQ999lDaV5S78+h9J
         c5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690483673; x=1691088473;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XvF866ztULgHIPw5eL1RN11YaiqIOMwtk4/chVGttM=;
        b=eB2JAEiYiVEwhzELVHAt/bbvsSi+pxuacWfwnoNbWNfzid4QtDiwQ0CjRF7+V+PLue
         zs91bwNfdxc6PZO3+GBczc+uOTskPtie0agRF261EUJlGFcpTVH7Z2VRB/z9JVK3oDUr
         zxg7uo1lvoGgeRMdanOmrYmEaQAS8x1kAXAcAotbIwSRzS6ul0DhgcYjwqn4TbmaGxzz
         XX+gSHhWIOy1nXom4AhBIGPItUFutjcPtxRqyybkoKWecqmqmJoCrrF940xnxUxkAFuR
         loA+9Plh4GjK3u1ydk06SSXhBCG71E45wD6zYAvrENlx4EVW1b0wuPgJJr8xSaLtY6K8
         MdcA==
X-Gm-Message-State: ABy/qLa1YMFz66MAL9MUCSvhZR0HqMoueSbXKNTfH5gjb/65aotKNJTn
	toZizcRNfuA7kQkt3dqBoukCwzceRY9iyrmeoN9BjwKwy1bJZkDISoTxNoXFBkUhiGuicGspOus
	siNxIZx/oBObufw/YVjsaAW2a6JYzULYKfDGkT4/IxMVOrdVcTnXSn1vogsbTJqtqI65b9bOD4i
	k=
X-Google-Smtp-Source: APBJJlHC0EJ/ZnFMvRwc+vzjo1EJ7tqQHpcDYIDo4IH5U124b4yoxY3GaiX4nIxDTkMdNuvKftKOjR+doQpWtKrh2g==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a5b:b87:0:b0:d08:ea77:52d4 with SMTP
 id l7-20020a5b0b87000000b00d08ea7752d4mr1291ybq.12.1690483672710; Thu, 27 Jul
 2023 11:47:52 -0700 (PDT)
Date: Thu, 27 Jul 2023 18:47:36 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMe7wmQC/x2MQQqAIBAAvxJ7bsGssPpKdNDcag9prBCB9Pek4
 8DMZEgkTAmmKoPQzYljKNDUFayHDTsh+8KglW6V0QY3fnCTeOJB1pPgOjRjpzz1pndQqkuoKP9 xBtfB8r4fdDeJKWUAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690483671; l=1712;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=pw2OnwKxZrU0fqWJMkgCfD8ikP7Zr98XMlM0CGw/HCs=; b=A2pE/g9ugylWNMW57WLW+zpjMGcd4rA3x1kSIAELasXFIvuGartw8/0EXcTAsCmxXMCiovMV1
 OJubtj1Omd2DCIF+Pgzq/A/NWp9kw08uPvAjwNe48IaFJ/QcDZA7QqI
X-Mailer: b4 0.12.3
Message-ID: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
Subject: [PATCH b4] b4: fix from header not using real name
From: Justin Stitt <justinstitt@google.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When using `b4 send` there seems to be an issue with the real name not
being included in the From: header.

Here's an example:
| From:	justinstitt@google.com

Whereas, something like the following is preferred:
| From: Justin Stitt <justinstitt@google.com>

This patch fixes this issue and achieves the preferred behavior (above)
by properly using both parts of a user's `from` field from their config.

A .gitconfig like this now properly works
| [sendemail]
|   from = Justin Stitt <justinstitt@google.com>

It should be noted that myself and Nick (reported this issue) use an
internal smtpserver called sendgmr. I'm not sure if this is a non-issue
on other smtpservers but the fix I've outlined in this patch looks
universal for locally-ran smtp commands.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217332#c9
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index b974642..760ba33 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -3259,7 +3259,7 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
         else:
             envpair = email.utils.parseaddr(fromaddr)
         if envpair[1]:
-            smtp += ['-f', envpair[1]]
+            smtp += ['-f', f"{envpair[0]} <{envpair[1]}>"]
         return smtp, fromaddr
 
     encryption = sconfig.get('smtpencryption')

---
base-commit: 099c9b47b39b6076752b8c757872080fad8fae56
change-id: 20230727-fix-from-header-c81940de575b

Best regards,
--
Justin Stitt <justinstitt@google.com>

