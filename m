Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FACE57A
	for <tools@linux.kernel.org>; Thu, 27 Jul 2023 23:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620AFC433C7;
	Thu, 27 Jul 2023 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690500008;
	bh=yU7qfpYbJrjUiSjaVsB3UmyALDfSE45Q5a0ActuCi7w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=e3Qdoe5zR43yJVO111PY5wP/hOxrQtruccscHxz/FoJxFc3G2AOJ3TfOrJc94x78/
	 3RTa5ObB0R2UKH5rZs6heJarH3f2vjDisX/C4zE9RRyXQk0NMowZY3AMv7ApTm/6ld
	 sZDGV4iLvtsQQj1BAoDQjwwOLbib3oUJnn0FGAT/aqPpYZJw2bayVxzT1dFZBkIgDE
	 kzo2yBArBa/8UiTo1juoe5/ZPfhvr7HSq68Ls1mDzcZJHhTjbAWabOWu8fIM0dCggP
	 clBpZ23V/4Ey/H+umij+LyK+Qwon5AHmmEYolmJD2RddCBdUwQx/Kribqhvr1IF6Yu
	 DeDbSpKx7r09w==
Date: Thu, 27 Jul 2023 16:20:05 -0700
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>,
 "Kernel.org Tools" <tools@linux.kernel.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH b4] b4: fix from header not using real name
User-Agent: K-9 Mail for Android
In-Reply-To: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
Message-ID: <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 27, 2023 11:47:36 AM PDT, Justin Stitt <justinstitt@google=2Ecom> w=
rote:
>When using `b4 send` there seems to be an issue with the real name not
>being included in the From: header=2E
>
>Here's an example:
>| From:	justinstitt@google=2Ecom
>
>Whereas, something like the following is preferred:
>| From: Justin Stitt <justinstitt@google=2Ecom>

Hmm=2E There are actually two "From" fields=2E There's envelope sender "Fr=
om" (which is what -f sets), and the in-body "From:" field=2E I wonder if b=
4 isn't constructing the in-body From: field, and when missing, the MUAs ad=
d it based on the -f flag?

>This patch fixes this issue and achieves the preferred behavior (above)
>by properly using both parts of a user's `from` field from their config=
=2E
>
>A =2Egitconfig like this now properly works
>| [sendemail]
>|   from =3D Justin Stitt <justinstitt@google=2Ecom>

Perhaps what's needed is this (which is what I've been using forever):

[sendemail]
	envelopesender =3D auto



--=20
Kees Cook
