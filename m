Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8C261571
	for <tools@linux.kernel.org>; Tue, 11 Feb 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295646; cv=none; b=mkSYssLMSmt7Eez5hXRvYKY5cKbrFm3vjof47ipj7EwU4utR3X3rFOFZXhWNN9bfPCIvUnfI5cZVmv15zwsqXp5G9/ANIMNmZiYUP1DLSChfAKazuIL3B04uZ9mwSIxHV3+lT/4itfeMbfB5EjzeaSECHH44bamQkITxMEeYxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295646; c=relaxed/simple;
	bh=Gl89qtb2MUsfe/8pKuOXnBbxD2G598AXAHnqxWboVm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8RqbqkggmvGwtueLJBA5+c9roQdjj7kBgamdG86FnnozSHboO6sF2MbUaAkyHhmkec+L+kmTOfHcs6enGF8OjlhOQgz442Jb4gpI9KKqSe7DaykhMcW/GcILKNakKc1hPXFuOXU57fG+VhVscRvxE73EAg6N6VB4JVLOZOdoEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B/W6UsmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B/W6UsmG"
Received: by smtp.kernel.org (Postfix)
	id EC657C4CEE5; Tue, 11 Feb 2025 17:40:45 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93D0CC4CEDD
	for <tools@kernel.org>; Tue, 11 Feb 2025 17:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93D0CC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de6e26db8eso5524832a12.2
        for <tools@kernel.org>; Tue, 11 Feb 2025 09:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739295642; x=1739900442; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz+2zlib0S1+CTvsIUDnMSNs7707USycABHIy9UgNmQ=;
        b=B/W6UsmGi6j0kI8F8jImfYlv+7LOukkgJDz9sas/9sbe1v2ARgpGdykPrXFQp5HmKX
         rpAesXgR11SkBuCuNgdZ6Wow2i+cRUBzxcVl5JgAyGr5mAx2STicb0LHSqR5FoOJcVow
         uoasgWZFLhNOb4fM8xIfCoBm1q/U0Dr7BfeyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295642; x=1739900442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz+2zlib0S1+CTvsIUDnMSNs7707USycABHIy9UgNmQ=;
        b=k68KrZbCyeMJ133P1xU9/XgqEFWggmASzpBEiSTwOqAi6d12f4hSchUglg0RbFJbj5
         OO5hV6btmduN4MKPWrYrOfDaj7TOjnons13bhp5U8F4ZTwez8As5y1OC7Q+yzBpCif8O
         xqUzoiIit6/bDfpWe1lOGE8UPkNTvivnil6VEgsswldU1drBFBrqlqcNjxbk+UBCNP7l
         CPEgM3tU/gww0C/XjWzDbJEggsqDmKWgPxYf9jFhGIuzjat3u/muQGkq4GEFeflsEetg
         1gHsWsrFHOwZPOKO3YrGys9aLYoGeaMB7cDGE+L9ElOCgn+CCmN1QHNZjUeLWaO39YRi
         K69Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKtWZ7bkM8Q/2O/7aN0ukISaLCUQ9f+noklSCO0tvlrSUA4yd3wCXTcp/qN/zruIwA4LeBWQ==@kernel.org
X-Gm-Message-State: AOJu0YxO6eLmOpSF3UDQj/EEEONmzVkb/IwiyLcfvl9wCRyFt8gZUFNn
	3RX97lVQJycWWQtDPhDpWcyWY5BWLSHJyNPvaKfTiLrbLclKEVx/vAkwbak6Sc+ermtxOiLtYaO
	2/1o=
X-Gm-Gg: ASbGnctK0AnzAPkBPt3+qYINF783nyPxTmxcZo3qB8W5D9AAvBhsrLWR6eiby6AjnKX
	+8g0bkAdlY3eRhKWR6tiqqzu7Z/RDcu3So/0BXRllmCXWten1Yine256Sr3hyxuQHq+hIxvEtkX
	iT25MnOo7T4Z11nnrogHaZFoGNVigtkc6n92CHlPkmlTRb3MwbvjdXryJmNglSJ31ZaBbIwYAWb
	1kZURMPkrTK582uNJdHl0AS7S76AjYaHk1jocv9h7ANhXq5c4Es+0ZWP0XTPhXEKtyDHMpqzPNX
	1qi0uyN6eMAOj+5ZM4oBqlKdooZZDalPFHUIFhI+Efhb1wYkN8bvWMUfh2bs1dt2/Q==
X-Google-Smtp-Source: AGHT+IGSHRx7B2ZdCp3D3RIzS6TM9GHqMjFY3dheg2N/i+XpJ1H+gS1nGKkPcTxIukX1K7iAmHzfWQ==
X-Received: by 2002:a05:6402:2106:b0:5dc:a452:4f7 with SMTP id 4fb4d7f45d1cf-5deade07f4dmr51656a12.28.1739295642611;
        Tue, 11 Feb 2025 09:40:42 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de3b3dc390sm9062167a12.62.2025.02.11.09.40.41
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:40:42 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de6ff9643fso5192071a12.3
        for <tools@kernel.org>; Tue, 11 Feb 2025 09:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdJ7j4TgzphJEME5KYmGrG1dWLLE+INWpqovXGIMZoykBlqy75lKzIvTCn90LFerNGnxzNmA==@kernel.org
X-Received: by 2002:a05:6402:278d:b0:5de:44b1:478 with SMTP id
 4fb4d7f45d1cf-5deadd05019mr166853a12.0.1739295641520; Tue, 11 Feb 2025
 09:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz> <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
 <20250211155614.GY1868108@google.com> <20250211160125.GA2274105@google.com>
In-Reply-To: <20250211160125.GA2274105@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Feb 2025 09:40:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
X-Gm-Features: AWEUYZkX_fOqnnjmQb4I4Q6pfCSRa56tSaSWMI6CSJkYDffeNhXYzTzv3XAJhhs
Message-ID: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
To: Lee Jones <lee@kernel.org>, tools@kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 08:07, Lee Jones <lee@kernel.org> wrote:
>
> > Out of interest, how did you apply it?  b4 was playing up for me.

So I had no issues, but I don't actually use b4 to apply the patches,
only to fetch them.

>   Fetching patch(es)
>   /home/lee/bin/apply-patch.sh: line 134: /tmp/<Z6Ow+T/uSv128wdR@duo.ucw.cz>.mbox: No such file or directory
>
> Where apply-patch.sh: line 134:
>
>   b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}
>
> My first guess would be the stray '/' in the Message-ID.

I don't know your apply-patch.sh script, so maybe the bug is there,
and it's your MBOX thing that you create without quoting the message
ID.

But in case it's actually b4, let's just add tools@kernel.org to the
participant list.

              Linus
