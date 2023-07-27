Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6F3D68
	for <tools@linux.kernel.org>; Thu, 27 Jul 2023 23:08:12 +0000 (UTC)
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-6b9e081b9f7so2327560a34.0
        for <tools@linux.kernel.org>; Thu, 27 Jul 2023 16:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690499291; x=1691104091;
        h=cc:to:from:subject:message-id:status:references:mime-version:lines
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fVM1Ry/0U+Gk9mZVpkqCNWnmsbq9NudeOjwG9rK5NoA=;
        b=i/3Fzgds0BbJwocGDOsrK/TUhxOYkIRS2mzvJBMH2UFOWYbauhn1MEJdC4x5vJl0Z7
         +3ks7WzBUATJRq1PzlUhJ4nJ6khthczICYWByWfoZoiebQSMgxdysj3TGVi0CPSdjJEs
         YuylmzTItSeoB8geH5xEk6zFjYvcgZAlTrx9Uu3Uj57hUpY2RDSwF28Ehpd3LjN32bO0
         AhQGNqOmDNLqNdilTuiKg1EhXo+xsOpMiSV+39n1khbrXo3FRYjRCv/YBUOVQNK7We5z
         iPqcwTEnOlv0Yso4HxtjTlN+cl9Ha5ohYngC9mm/FBjQARE4aKw35d5iaIyJ90yjx+hC
         NP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690499291; x=1691104091;
        h=cc:to:from:subject:message-id:status:references:mime-version:lines
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVM1Ry/0U+Gk9mZVpkqCNWnmsbq9NudeOjwG9rK5NoA=;
        b=TKd3YrtetoYCAEcQfUzY8AvKmDaccEcCRK3hWOPeHCFsLZ9fXPLXX4CwCNUzwuk+GC
         Av/IS4PwqP/AqqtDRYpeieaAgs2jfwZ6h3niq0X9ulwbxX1dVMXRvt8b+gLsJMvvUWw6
         2sneFkBQQxZXHAaL6/UHFekP6dfqHwZLEPPv0WPYmatDiCtGjiggpz+tt9mXqLEF9ct+
         WjtFojJYAJ0HJW7iR8roG8uTFGOq8Ok694h326+qpKn68t5DSn2NL9WQg1J8x26EB2pA
         GXH1EwOCeTf44O3+6k5D7fXEMibOwGeTHK402ydEfqDBihumRPpsBTTnoYD8B1Rd1e/o
         DJiQ==
X-Gm-Message-State: ABy/qLbA7d9XzFb9WLyTuztTJdUEr+jZHGHdmdKLX1f5ve/ojgCpuVrO
	jZttVYvbtQHwO6AfX/Nrn41XMunnC1n/Ciii79lovInWw6lazIQZvgzACs776BVtukuTSRIXEab
	xyYNBI/w/6srTnNTAxZcjiPf+53S70lN8mpI/96GGNOU3cuJzi1zJbQB2qdTYD2/h1pYHE1YLvZ
	k=
X-Google-Smtp-Source: APBJJlH8NIGqrfvyf/5WklDHoNgJEY2kHO1DyD9XWsi8E939dKqmgcw69Oz0WfHcSNifwcGR5SGsBkiHtwvUtzS+vg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6830:1605:b0:6b9:1768:b318 with
 SMTP id g5-20020a056830160500b006b91768b318mr760798otr.5.1690499291573; Thu,
 27 Jul 2023 16:08:11 -0700 (PDT)
Date: Thu, 27 Jul 2023 23:07:44 +0000
In-Reply-To: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
X-Mutt-Fcc: ~/sent
X-Mutt-References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
Message-ID: <20230727230754.3917690-1-justinstitt@google.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
From: Justin Stitt <justinstitt@google.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 27, 2023 at 06:47:36PM +0000, Justin Stitt wrote:
> When using `b4 send` there seems to be an issue with the real name not
> being included in the From: header.
>
> Here's an example:
> | From:	justinstitt@google.com
>
> Whereas, something like the following is preferred:
> | From: Justin Stitt <justinstitt@google.com>
>
> This patch fixes this issue and achieves the preferred behavior (above)
> by properly using both parts of a user's `from` field from their config.
>
> A .gitconfig like this now properly works
> | [sendemail]
> |   from = Justin Stitt <justinstitt@google.com>
>
> It should be noted that myself and Nick (reported this issue) use an
> internal smtpserver called sendgmr. I'm not sure if this is a non-issue
> on other smtpservers but the fix I've outlined in this patch looks
> universal for locally-ran smtp commands.

I wonder if this breaks other non-sendgmr use cases and as such this
patch should take on a different form. One such idea is checking
specifically for sendgmr usage and adjusting the -f flag as such.

>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217332#c9
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/b4/__init__.py b/b4/__init__.py
> index b974642..760ba33 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -3259,7 +3259,7 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>          else:
>              envpair = email.utils.parseaddr(fromaddr)
>          if envpair[1]:
> -            smtp += ['-f', envpair[1]]
> +            smtp += ['-f', f"{envpair[0]} <{envpair[1]}>"]
>          return smtp, fromaddr
>
>      encryption = sconfig.get('smtpencryption')
>
> ---
> base-commit: 099c9b47b39b6076752b8c757872080fad8fae56
> change-id: 20230727-fix-from-header-c81940de575b
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>

