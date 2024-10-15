Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E01B2198
	for <tools@linux.kernel.org>; Tue, 15 Oct 2024 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000846; cv=none; b=TxhOaYtHCGwYhVtwl8lMgNfI0fwqnn2qjCz6lQWzI796F+6IsxTmCYmGicTnxqgWK1Gs5WZzqYbcoDE5X2QJzjYhvwDyuWwp6TtBnekPNBpI3GACViX7jh2h5eHIxoToIHfTCKg7t535lvSPljGKv27ZOVLp3h+nyycRPgtdiJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000846; c=relaxed/simple;
	bh=SejiT5p73EnrtiKB/YbRx8seIV66K+hxuAAlxgC3yjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4atF/Vsrl1xG1NotrAQxsIng2taxs2U72n1vDy2EBi5nWwxaWeFj4ZfzjcD41gvgyH/klOJJ+lyJjd/VUTBb3SLHimwfg+dPRh1HvUMdT0fwQ+tqnYQvLf8ZWAP9GsneCHoGcOVLGcXqoY7571/NvTo5D5HILuBJdC4HIveHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbaDsj/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbaDsj/e"
Received: by smtp.kernel.org (Postfix)
	id 8C527C4CECE; Tue, 15 Oct 2024 14:00:45 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CFE5C4CEC6;
	Tue, 15 Oct 2024 14:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CFE5C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so4565322276.3;
        Tue, 15 Oct 2024 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729000843; x=1729605643; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SejiT5p73EnrtiKB/YbRx8seIV66K+hxuAAlxgC3yjs=;
        b=MbaDsj/eSSIESP52SDeqsx1Iuk6P+1RIPPinWYvkzCzbpYPSKKEgM51RMArhqlwiGM
         n3BoMXYyVY16d91r3hof0hmjQS6AcfWV0qsSVB/DAXm9MJTxo806C2ie8HIJmqme26yF
         L6UmXaJ4q15Pl2jLWMLERXlK5Al297Vcvc88Mmi4JGydNX36n+x6oYMCGbioJhleuuoQ
         STQFAkqZ0y7ga8pGvUeogbQsYmVH/2BT9WCNieK+qS9F451UZSkEAIwqnlaDtvKdVGfY
         ZylesKTtWjkEJWPQ8uT4SfYPXStUlgS8SWqot4D3c5uS35RWzItE968R8ouuruHeqJ8q
         sR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000843; x=1729605643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SejiT5p73EnrtiKB/YbRx8seIV66K+hxuAAlxgC3yjs=;
        b=v/VwjikRFyUJJsguWc3781+WXhJFV2CydqBpDqXVXSs6eD+ntSsKnWQGSvmwY3g7ZZ
         FuJ6TgakF+eOiEyNtGhJvJ3no9oLa2FjhZHBEag6kcOi1IwxIAjHvEZXAVu7YZbRzoT5
         OmE52oPxjy28D41iM+EW7WSxZal0WaeLMyoSD4s4Lch/cX9zmBVt/1UQU6h7YDIx7Z+w
         BQkh9SYw2aQw4JFbNVq1pCjulhTJ8cH56Uybj52FJiLgHC1PNzXT1nJmTS9cYIp5efBw
         CBEoujl+H6GAL2d8TJOTxIzEQ/yCeN276SR/X/IP54fPI6E86IU0WsUn76GF1wp/DUMs
         hr7A==
X-Forwarded-Encrypted: i=1; AJvYcCUKIJGYTh1/Xlh6LhOwckqxUFBSQVDOS/3yis2HUxBj+CFZoxPWnZjQ1yjZWkqQmkiZAls61A==@kernel.org
X-Gm-Message-State: AOJu0YzMGpsmDxRJwmZk+vwgFK/kK/G4VZARU0zSg8KIFhPyDtTkzHEd
	e4IJrfvmGr9dfoh60ZDfO4i+hsWhLvJleJ4x7CiX3ZCWL3M1qI4mqc2dXZOGrl3eIvRdoWmFT2Z
	MEmFBypj+jg5HGTDw/ZEaAcLE8Ts=
X-Google-Smtp-Source: AGHT+IGweLFc8ucyxjjhZouJ//1pJRo82VJu1HUZiqlesicxrqNlkuMvxelkpGdZm8ulrOhKLVty/KG/d+pUWns5z2g=
X-Received: by 2002:a05:6902:f81:b0:e1d:2639:66be with SMTP id
 3f1490d57ef6-e2931bd76f1mr8508531276.43.1729000841174; Tue, 15 Oct 2024
 07:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAOiHx=nHXJLVM2ZfDGEi+VDYPhVuoZdpYhLTQwAGLgUiVmZvpw@mail.gmail.com>
 <ZwuiaKj1pgjZ3-sR@finisterre.sirena.org.uk> <20241015-discerning-chimpanzee-of-efficiency-0b62d8@lemur>
In-Reply-To: <20241015-discerning-chimpanzee-of-efficiency-0b62d8@lemur>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 15 Oct 2024 16:00:29 +0200
Message-ID: <CAOiHx=m8tPANa+5A2dohEdkz48aPgH1g7ZXvF4uLmEu+SCo6DA@mail.gmail.com>
Subject: Re: b4: adding/updating individual patch changelogs?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 15:24, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Sun, Oct 13, 2024 at 11:35:20AM GMT, Mark Brown wrote:
> > > is there a way to add/update changelogs to each patch of a series?
> > > prep does it automatically for the cover letter, but I find no option
> > > for the individual commits themselves, or it even mentioned in the
> > > docs. Ideally something where b4 automatically updates the changelog
> > > (templates), but I'll take anything that does not require manually
> > > editing the generated patches themselves every time.
> >
> > If you add a --- and text at the bottom of your changelog in git then b4
> > will (or did last time I needed this) just reproduce that in mail that
> > it sends.
>
> That's the recommended way to do it, yes. Until git-filter-repo is able to
> preserve git notes, there isn't really any other way to go about it other than
> keeping things in the branch-description config value, and I'm worried that
> it's going to be both fragile and without any way to push it to a remote.

When using the default commit cover strategy, b4 seems to be fine
handling the changelog for it in the commit message itself. Wouldn't
it be possible to do the same to the individual commits when rerolling
a series (or using a specific command for that)?

Best regards,
Jonas
