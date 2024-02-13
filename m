Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD225FF07
	for <tools@linux.kernel.org>; Tue, 13 Feb 2024 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707845904; cv=none; b=V0czcim9ScFyEsH47gpM4448O7vW0wtyUyK1RBCT+RgBY3wSJjV86k53AZVJWL3DT11eL7zNXUamG5+ZNp2k4S3B1odVWeMT7q86UZpKq1bRTu+hm3OHrpXF92nkjskO8mXZabcRR/fLGWq7dGQoillOruWmtbiMu0aecu32O1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707845904; c=relaxed/simple;
	bh=jlRn2m3RyQRlaIxG/ZKFJ/TSzOW+TDua51aSXcNi4e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSHW5qerpStOukalw5i7Siqef6sHX92BdE7j14v89fRNHHfN4kytbu7z/1iJZ4WlzL4b8GFyiyDCB7MrKTbS6fCVerSCkE/GyXPrYqBMeg4ye3jrAojEM+YZgs7sAt/EgK/NIYygps8TTN2Ox6l5KkoIfOzdLo/v/h8AKPfkJ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cupvfEmM; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cupvfEmM"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60757c46e34so12027867b3.1
        for <tools@linux.kernel.org>; Tue, 13 Feb 2024 09:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707845902; x=1708450702; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IbNqttp3ic3kacjSKQyPi85acSzBBYXGHTbxpMS3Wk=;
        b=cupvfEmMFFsbjv9A2YpJzn7SZRBt9GSbbacBMTRETLnr3WX8S6KVo1NfyyVYsEzSh2
         yWzZ4A9q3CdEcVe87k6g06ZqphZyTujielCjZjNxTAGg4P/sxEruHY84WqBuiYHrWldb
         j7uK1okEYDGBGIH36SnxmWT3X2cnOJXhEWOFwAZVKTVmgvAAIM5zzhXEjrtRTk3WSffK
         YyqpzzRIc4JCfLXEIEKARKjVPWjD+KW1UMt9jeXVXzS8tneWu6H0HU9KmnpgshbcE7JM
         +ArbWP5Y6kzcFxqdtfG3Pn9qSJg8ZtjS4RID/laho9IOoyXdkMEyw3Ot6WSZ61232w1n
         WFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707845902; x=1708450702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IbNqttp3ic3kacjSKQyPi85acSzBBYXGHTbxpMS3Wk=;
        b=VuaD96HjPpMa/0h+HIQ6ifbwv2EzGSM0m8D3jfT2+ePbyRV7mDEce+sbRlJq0Iddug
         0qBx6nAl7mh4g3oM8n+k8uvkv42V2TBOIBWCXJmnmIRiGuQpZrz//Qw1VpgMDxNDKDT7
         I69ysZM+izJS41DJkw0V6vVNWy/1dQeAgRT1u10XWbOcZXaKczabdy2I4UIINA84xcTn
         AXaQJqC5Ajf5KugqTA6DqAdFssrZbgeIagZqbzNIBo+4f0KmZxfvIqOwY1pyFXsD0THy
         BHStr659Lub4NUsMVk+NlGeF8SpSl1Q/WOefS20woq/RCypgJqghSbTPuU6/yQY9N1Ef
         ZwCA==
X-Gm-Message-State: AOJu0YyZx2lqSPcmGDQ1GcTczOS9zowkXPdIxYfVT4z4WT9L6opeNt/U
	/8Y95ZXo6EHA7KXz4jqpCEZ7u1SDx/qhE/i7L0rxtCyyGZuq5u1ByyUMA6u5n/PBw6vcx3V9S32
	2pQO4hWWYbbi/Q9xOt9XMNyjHXK8BGpEK0XURpR4+r8naMS0=
X-Google-Smtp-Source: AGHT+IG8zm59f/6tPI8ucSZRFDfgTTvO4QJf1yhWJ+1wJli72sTv5oqsfBLFaRNy6S+0eRL23uTZtlFfSvm+hfPVqjs=
X-Received: by 2002:a0d:e702:0:b0:602:ce22:7079 with SMTP id
 q2-20020a0de702000000b00602ce227079mr29894ywe.41.1707845901813; Tue, 13 Feb
 2024 09:38:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur> <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
 <20240108-urban-nice-hyrax-a0ee5f@lemur> <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
 <CAHC9VhQTVZtY-9VfMunERWnEZ7ReDkYRm07QGsmEYwyU3DC7JQ@mail.gmail.com>
In-Reply-To: <CAHC9VhQTVZtY-9VfMunERWnEZ7ReDkYRm07QGsmEYwyU3DC7JQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 13 Feb 2024 12:38:11 -0500
Message-ID: <CAHC9VhSXHKWHSBiLQjD73emXSrLG8J7DCYLqEuBhVcgZezZOfg@mail.gmail.com>
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 4:12=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> On Tue, Feb 6, 2024 at 4:00=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > I'll dig up a lore archive link and post this for the stacked-git folks=
 to take a look at too.
>
> Here is the stacked-git GH issue that I created for this:
>
> * https://github.com/stacked-git/stgit/issues/414

For those of you who are interested, but not following the GH issue,
this appears to be an odd interaction between git's send-email command
and the recommended patatt sendemail-validate hook.  As the stgit
maintainer pointed out, git's sendemail-validate hook template treats
a patchset's cover letter differently from the patches.

It looks like some time of check should be done in the patatt example
hook to ensure cover letters are handled correctly.

--=20
paul-moore.com
