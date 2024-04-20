Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A939B
	for <tools@linux.kernel.org>; Sat, 20 Apr 2024 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713577080; cv=none; b=lIIfvWRs2w6TnzyY4sNEQK2kluyDpY0+2d4VJAcz/+BsogrEAoj/9cuFmySyktr4AuIi7dLBIOuJXUTIy+5MRoJuDpr30oMH9MpPGq34vjRoyR0rFzUaNjayTV/bAJvisKXa1vL/1TOVFI0FhRtLlttNiIBXqHriQQ5b3gnM+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713577080; c=relaxed/simple;
	bh=bSwQytLLzndZAUXGdV10FzaFkFB6bUUyCEMURXpALII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwmT3A8X7e5aPMJr2IRDZCyB7VC2bZwyx1wZc8AWLMc1KDnbJVK+24NqHS0akDb37LCtD6BqU/klzDz95hMR6hMDJxyNvAh/BjSTawmqZPfSonGLgxLA86jvkMzSvVX1K3v7yAbzY/XQD91WueWQPSyToLAi4EpgB38QINDhuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fyEugExl; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fyEugExl"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-479dbcdba2dso1018826137.3
        for <tools@linux.kernel.org>; Fri, 19 Apr 2024 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713577077; x=1714181877; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bSwQytLLzndZAUXGdV10FzaFkFB6bUUyCEMURXpALII=;
        b=fyEugExlKtdOhMfPRZMoGnaCTO3jU6xUuwmsYI2BWQCXkamppXD1hyI7tYGHOx4AqJ
         Ei/fEknA7dSvyEEToEuXtUBpWxb1dYZbwE75XFd1njPL5TkjRTlN7EwbpaZDw2ivrADu
         SvNIW2jqWLM/F5VW/8dNiW7m9Itpnghj08X/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713577077; x=1714181877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSwQytLLzndZAUXGdV10FzaFkFB6bUUyCEMURXpALII=;
        b=jMYL2poyVAZyPAJbiQvrUNFdbdnqnjKIi85qHcKD0jjDKuaxn3QVLl4kZ2PaBx/l1a
         WT12sexwZINf+WGBaSpyn8hstPqsY/3rowGYnnC/eDVevN9/gqzIV8TnRe63tFWegnbs
         3DaqCKWd6pb3wR/ibHVE1rxJKl1qeOqkHVs81+re045Hy+iLYjoaBr1Ox/zQUPrKrbcx
         5Rkrp9XMSnxQDn15io/W6DJrA000xGke2fvPrIMT/KNdaZY5TtLwUkW4lBk0H88SwtrE
         Gax52t6DqYaBUiAUbunMXap2g00ilqJVfmUmepaMpAU4YafCF3uk761Go4D3YofEEX3I
         PX7w==
X-Gm-Message-State: AOJu0Yx36PLM4xoG2mMy9EPrBrliFBFDHHXSOt88EQVcwJsD3khAx508
	OGOYNO9bBfCQTNx6xC2MxqQQPXe8BFgEPAUiP8J2RGyicHSPvQpptDmY6pTXUUafIb6o3yPOyLM
	ahExyRTWKjxX8wM60LNWFBoEtAIyX9aDQzTdNcw==
X-Google-Smtp-Source: AGHT+IE5RMLVchoaE+88FQ5JJ0Ulfn+3maeM27+PgxFre2CfYO/lrhRn4+MyP7wyeEaQeRKeueZ9qqMAZ/oT2nH5hnk=
X-Received: by 2002:a05:6102:4b0:b0:47a:3b05:8bb4 with SMTP id
 r16-20020a05610204b000b0047a3b058bb4mr4082022vsa.8.1713577077544; Fri, 19 Apr
 2024 18:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
In-Reply-To: <ZhQ8DoS1GaT0603l@sirena.org.uk>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Fri, 19 Apr 2024 21:37:46 -0400
Message-ID: <CAMwyc-Q466R2za0sMTD9Chx77hL7xBBuNROokemLmp7dt=i10w@mail.gmail.com>
Subject: Re: Checks for recipients
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 14:48, Mark Brown <broonie@kernel.org> wrote:
> It would be nice for scripting if b4 had a check similar to the
> needs-editing flag in show-info which would allow scripts wrapping it to
> determine if there are any recipients specified for the series.

Mark:

I added some stuff today that introduces "pre-flight checks." I'm not
sure if it's quite what you were looking for, but --show-info will now
give you the following data:

- if prep --check needs to be (re-)run
- if prep --auto-to-cc needs to be (re-)run

It doesn't try to be very clever -- basically, if the tip-commit of
your series changes, we assume that you'll want to rerun the
prep-check and prep-auto-to-cc, -- but it's effective. I just hope we
are striking the right balance between "useful" and "annoying." :)

Can you give it a try and let me know what you think?

-K
