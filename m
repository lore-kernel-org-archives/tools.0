Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543A5FDD4
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709726625; cv=none; b=epAgMDpnqel12t+bX6l/E8RyguKYZOMdczaFkbBkDf7wzGH5pYGpNCa7hnheNeXf/J2JoZnTvY42cVDpl+LOeE3D4LUamNZTcJd8csGLFTcwwF14dp4CuAn83oAKbDUa4W9oRSEggflNeNrkAQwAFV7zHGsCxxAOwppUFc4nAN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709726625; c=relaxed/simple;
	bh=3nOAkQk9sFKg8BzuPeK9U+48btj+DfmFOK/8yOKWGRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRiBhsQG1HtqAITAc93xRcnhr8x4dC66HVqYzrRIfU6cpd3iBuG8m+V9PdHOs9AcokIlMg9d5Zi0gkHxyt7cqQaRXvqlLfY7f8UFy8xv1D3ibJfJktuXfXhbcGrdZy8HxjvVtQx3PVHX4KXe8McYvA/MvRIQp23Y+70UgYEIICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6ULRZf2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6ULRZf2"
Received: by smtp.kernel.org (Postfix)
	id 426A3C433C7; Wed,  6 Mar 2024 12:03:45 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B971C433F1
	for <tools@kernel.org>; Wed,  6 Mar 2024 12:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B971C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc74435c428so7420078276.2
        for <tools@kernel.org>; Wed, 06 Mar 2024 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709726623; x=1710331423; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QzZTmOkAk8CG1qezS+bHVqohvj4VV4QWfrchmxEJmeA=;
        b=I6ULRZf2uB6Jlj5k709hTblXlW/aLWCsJrc0bTRwMNwKu91e1brB5Y+KjRZR1fXaBe
         xwMyEshmw/VBIablBf116/AchECZ2/QYnnn4OPiv5avxDUAPN3t5iOOnVWQLyD5P6P4R
         Fxr8aNn5zONUpqLd9cCqaTxcdpfgADDMW7C0QKint8gLpcb26D3IKYnEq8mv91v+SVLb
         LKdl2AV3W8iLzm8Zt2fpoltRWwPDeGy/f2OBL9+JbiCRJ9ghtxwwEVTagRW3gDOXo+1J
         F5E3Rnq8KdRm3bKcFf+s4dwPVPrSncxKJuZVBuA6x4VYJRDdWDfqigGAmM161NeidY4A
         Udpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709726623; x=1710331423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzZTmOkAk8CG1qezS+bHVqohvj4VV4QWfrchmxEJmeA=;
        b=HpyJnWhK00XV4YGQQGAJUR9uz/o1XTO4tvfD0dU3DOUMJ5N0HZWe761uZ1CTyjeevm
         ku95qol5e3PmxWC3aUZ4fywk86+Lq2Z9xXPUwl/Ccolo/11yHseNyymFYP+0wVLSA9rG
         EDxZxsjv0bS9lQzTPPW0AaBYZCEs4ywi5SHfgjDYO7saFN34NnJv+2zuQa0A5kRXeNiu
         dIYytxAlbsSa5helhzZYIRN4p9t38PfeWfgEwjVTvFXz6tDqO+3Of409TybLGcMU2/Dn
         MY255eFa20pGzkckGxAcGQKH4VKu8tXzfjbEyQ7VrBWFJF160fqW3RkyZzOIkjSIqPut
         s9Hw==
X-Gm-Message-State: AOJu0Yz+COomAuF0kKf4Gold292/Axd2kZtRWc8ahlJmnE0oczcuwDjQ
	EkCmX0Kt4HSpAn1lgqg4CvkD79EwpeRL+SlXVsZZ8teM8nOmtdIrZ725C1cYGiBnStw+guSOmgO
	mRCF+V1P2X6BySeTRm/OsK94o/Ys=
X-Google-Smtp-Source: AGHT+IEvyN2F5Jdvyy8tBV2kxxA1e8lETbWDjZ+7uv2pUPI4BnpwNo3yBhx9+TXodllbtdw4ExXhLHMI/Nu3fPMTwkQ=
X-Received: by 2002:a25:ef44:0:b0:dcb:b3dd:4f95 with SMTP id
 w4-20020a25ef44000000b00dcbb3dd4f95mr11270852ybm.43.1709726623300; Wed, 06
 Mar 2024 04:03:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20240301-shell-completion-v2-1-741c88669859@gmail.com> <20240305-obedient-centipede-of-finesse-a35a86@lemur>
In-Reply-To: <20240305-obedient-centipede-of-finesse-a35a86@lemur>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 6 Mar 2024 12:03:31 +0000
Message-ID: <CACvgo53keELtth1xAapQD91EDrZrdK3XVVeVSVE+NX1cygnn3Q@mail.gmail.com>
Subject: Re: [PATCH b4 v2] b4: add shell completion via python-shtab
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 20:53, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Fri, Mar 01, 2024 at 04:59:23PM +0000, Emil Velikov via B4 Relay wrote:
> > For more details, see the website https://github.com/iterative/shtab
>
> Thank you for pointing me in that direction. I think I'd rather use their CLI
> integration, what do you think? E.g. we can have misc/tc-generate.sh with the
> following contents:
>
>     #!/usr/bin/env bash
>     if [[ -z $1 ]]; then
>         echo "Specify the shell type as parameter (bash, zsh, tcsh)"
>         exit 1
>     fi
>     if which shtab >/dev/null 2>&1; then
>         PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}" \
>             exec shtab --shell=$1 -u b4.command.setup_parser
>     fi
>
> I believe running ./misc/tc-generate.sh from the toplevel dir should
> get us the exact same result as your patch below, no?
>
> My preference would be to go this route, because it doesn't create a new
> dependency on shtab but still lets packagers generate and ship the
> tab-completion content.
>

The above solution can break in a number of cases and since there's no
CI, it can lurk broken for a while.
- path changes from src/b4/ to ...
- parser function is moved from command.py, or command.py itself is renamed
- parser function is renamed

Does that seem like a reasonable argument, or do you prefer the
standalone script approach?

Thanks
Emil
