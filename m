Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E911B940
	for <tools@linux.kernel.org>; Tue,  6 Feb 2024 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253214; cv=none; b=ggpWBf5qBkK2Hxes+0qQXn75MVjTMChHLXm5DjBZEpvgSRYfJCP2xczDGSCCDMXME5GzLe+vOREWION9r4cQXlSNEC7kXN8HzlYei4ivBtZZURDm/xGZw5YBTJSWuZ0oCD+b/ng+bQofSBe6hfuPtCuOeIludzoyM8xxNhVvH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253214; c=relaxed/simple;
	bh=K4e5/m3uy4Yw8H0QUB39Wk53IjFBdPawjfg8drwpn5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rj/nPqBBVskCZiottjYmy9IduVX0mEIi/jWNyHS95U5IS+7FnO1uWM+wt+SN0ZsKFH0XuACaGJ8hPd0s/hgjYChWEN0BzSa3yoP35iuflx7IeaAVsAv7d4rade9dlvr/87TVEnW6Y8daDRvmgqRSKdS1T65lXdhDtBW/64WGNtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ERAfbe9L; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ERAfbe9L"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc730e5d88cso7783276.2
        for <tools@linux.kernel.org>; Tue, 06 Feb 2024 13:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707253211; x=1707858011; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAcwHQuZe4YOh4sGcFLU1a19GAAsTcyhVFPUBbSw7so=;
        b=ERAfbe9Lg4JvjBIwMsE5rs7d78BMliJdLrb9/K0cU8aANzJU16uObEeu3uesI37yLb
         gylMKuvIKXG/1Wld7b6ceS6s5Q5e8tFx8pk1lx2OOCj8HM3TYYJCJvOvUgfgEB7upJ1o
         B4dbYQrcGmYd/rb8nwQSDVwjnPvOtiVwpBPe2x++nrDJ4dgYkyOWC7q9SSCzIXm5YOcl
         VgdoP3pGpAzDlcy5rBXxogcHMY/gEsOVBnTHMkxIF40gchsVxkSVm438A02pxNNPze4q
         t/tjizWoivkpDoZ8H4J2TEqOfLuwEeked38nh0txETOLeH2IbWiTgt+mQY/y+5FkuL3v
         JPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253211; x=1707858011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAcwHQuZe4YOh4sGcFLU1a19GAAsTcyhVFPUBbSw7so=;
        b=Pi5z1uVK4ZTJBCRXsxV9WvXVNKqs3OcXznDAMWP9+F5lRHq2WlmEgXJozbVj/qlcJ8
         QAb+p7etk/Dtnfc4zBqk+R7VnjdPO/jdOYw+69LVz77awx8cEBqS51cuIh5hy9+1QNaM
         n8SX3+S/TDs/Y6gsBgfWDHO+OVuI7oVe8t0avIzh8POsJ6peSx2XE/xc4EszuHxJ6koD
         +Me9kJL38Ge3nkUCu2z988wDYiH/Tl2/KpODWcS2h+jeXD793GbCcnFbKxw1/pHgbzRP
         V2lM39ZOG/UEI00SH7bXMUA/OWQEfiCVPgG4+g8y6nVqHk0PVQIEqmWUAh7+OEWOkN2p
         zFjg==
X-Gm-Message-State: AOJu0Yyq31CmbLrOrm+hKjSFAooNw8s242PiicCTM6eEgHLLvWbcPqzB
	o/+lDNmRiUat29DWEYxv/FS5AWgc59aOY9ZHfspqILA95KTRjEO+CbQIj1Ozi0bsIX9mBXh3sqy
	V03NBftqF9IRrzXBU4EkwR2VADdY+0b4FFrLknkRf7tQdMnvz9Q==
X-Google-Smtp-Source: AGHT+IHjb3JysXRuV/Z+KQgaVfjGvnueb2cwGz9jc/UDG0F3Yh/Kj3gdGrvgYRzRfvOM2GTTLfxUWsNTRF2/YUfa6yI=
X-Received: by 2002:a25:8751:0:b0:dc2:398b:fa08 with SMTP id
 e17-20020a258751000000b00dc2398bfa08mr2763182ybn.31.1707253211333; Tue, 06
 Feb 2024 13:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur> <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
 <20240108-urban-nice-hyrax-a0ee5f@lemur>
In-Reply-To: <20240108-urban-nice-hyrax-a0ee5f@lemur>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Feb 2024 16:00:00 -0500
Message-ID: <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 3:45=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Fri, Dec 22, 2023 at 05:20:47PM -0500, Paul Moore wrote:
> > > Can you verify that stgit creates cover letters without the From: hea=
der?
>
> Picking this back up after the holiday hiatus.
> >   % stg email send --to=3Dselinux -a --compose --dry-run
> >   ...
> >   error: `git send-email`: >>> HOOK DUMP
> >   From Paul Moore <paul@paul-moore.com> # This line is ignored.
>
> It's just like above, "From " instead of "From: "? That seems wrong.

[My apologies on the delay in responding]

I agree it seems odd to me, but we're starting to hit the limits of my
email/tooling knowledge.  I'll dig up a lore archive link and post
this for the stacked-git folks to take a look at too.

> >   Reply-To:
> >   Subject: SUBJECT
> >   BODY TEXT
> >   fatal: /home/.../.git/.gitsendemail.msg.C_MjHr.final: rejected by
> >     sendemail-validate hook
> >   fatal: command 'git hook run --ignore-missing sendemail-validate --
> >     <patch> <header>' died with exit code 1
> >   warning: no patches were sent
> >
> > However, if I send a patch without a cover letter I see this:
> >
> >   % stg email send --to=3Dselinux -a  --dry-run
> >   ...
> >   error: `git send-email`: >>> HOOK DUMP
> >   From 99e622c26aceab38caec40ba173cbf5044adcac6 Mon Sep 17 00:00:00 200=
1
> >   From: Paul Moore <paul@paul-moore.com>
>
> This is the line we need ^^ for things to work.
>
> > I'm happy to provide more debugging/testing help
>
> I'm not familiar with stgit -- how does it keep track of the cover letter=
? Is
> that something that you're creating on your own?

An empty cover letter is created by stgit that you populate with your
text, here is what I see in a terminal ...

>>> command
% stg email send --to=3Dguest@example.org -a --compose --dry-run

>>> what appears as the starting cover letter template
From Paul Moore <paul@paul-moore.com> # This line is ignored.
GIT: Lines beginning in "GIT:" will be removed.
GIT: Consider including an overall diffstat or table of contents
GIT: for the patch you are writing.
GIT:
GIT: Clear the body content if you don't wish to send a summary.
From: Paul Moore <paul@paul-moore.com>
To: guest@example.org
Cc:
Bcc:
Reply-To:
Subject:
In-Reply-To:

GIT: [PATCH 1/3] selinux: ...
GIT: [PATCH 2/3] selinux: ...
GIT: [PATCH 3/3] selinux: ...

>>> once I fill in some basic text I see the following in the terminal
/tmp/ya55aQjfB0/0001-selinux-...patch
/tmp/ya55aQjfB0/0002-selinux-...patch
/tmp/ya55aQjfB0/0003-selinux-...patch
error: `git send-email`: patatt: E: The following required headers not pres=
ent:
from
fatal: /home/pcmoore/sources/linux/selinux/.git/.gitsendemail.msg.GyKspl.fi=
nal:
rejected by sendemail-validate hook
fatal: command 'git hook run --ignore-missing sendemail-validate -- <patch>=
 <hea
der>' died with exit code 1
warning: no patches were sent

--=20
paul-moore.com
