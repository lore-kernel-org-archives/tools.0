Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213BDA23
	for <tools@linux.kernel.org>; Wed, 28 Feb 2024 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709081011; cv=none; b=oeotIj9PdRMcQm3nbw5S5ihu/4TZwZ+6HsHtlg2weDJqkPBcr+JvcyGWfLLQHWWnBo3EDyriGHIDzSw8VgLAPbCSb6+N8XhZHNBwuU9d6mfRHZmTmhZnCYSrQ07WQSO2U3kG+/hYuy6fb0wZi5nW9fqA3FQzPSlRD/Oz/irUfTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709081011; c=relaxed/simple;
	bh=cA+fnwnt//J3NfdO7+rLKW9APEqj65IbB51Mwl9Kg0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv3TBjWQJ9Y4G9CConAkPP4ycTamfY2mUcVPYe/lsXNBN05UZhlr8pi1eiUOgNEeu2pdRrxWT6DAXnaMyc2P72iu1ylNGOq/yy8xhRkNXlxluYcR2F3bJS4jvgMZhuLkKWzFDL6pyeZM7Aj9v69HLawTG7t5lkfoXkqPvkrTs3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dVpX1cBQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dVpX1cBQ"
Received: by smtp.kernel.org (Postfix)
	id E24A2C433F1; Wed, 28 Feb 2024 00:43:30 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3B9AC43390
	for <tools@kernel.org>; Wed, 28 Feb 2024 00:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3B9AC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3e75e30d36so55413566b.1
        for <tools@kernel.org>; Tue, 27 Feb 2024 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709081008; x=1709685808; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4R0JEfuygzXs74mV0uReUDXdjYhtO4vO7wERenZVrWg=;
        b=dVpX1cBQZpRvcrhQImvVSP4K++RTvPcHcqLxKWOWW9y+g9w54LO+1RNa6tAnJ+K+vx
         EyKtpDoCatjjqTkitUKiqA3JKO4BKZ2yvCvjEycIGsgBOro9AB16jYmAbMyzPGA7ayVo
         mHaAPQQrh/qYNvB9wJjhWts+9aPpd2/lScVOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709081008; x=1709685808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4R0JEfuygzXs74mV0uReUDXdjYhtO4vO7wERenZVrWg=;
        b=KUrMI+7DXssx/2TVM/PlITWsTDn38KmU9U6YIKjU2NW4/jduTXwE/Qku9X+CT+8BFn
         ZF9za82OR23Q4XcsHle6gU8piXhLm1VaDKF30yI3b8NLM2BK72yhBb5D7Cp7l0pITkq8
         WURSECkQZucZPDbYn29o0WP3dQy/N6fYFWurSX8FcjFsAH11AvCewhjgNl3MENqtodjf
         ZWCq5GR2nSjZo14E3/jXEE76w13utCqaZZR0iF/fbqmegtkkb1VcxC7Z1mr3HfMf6FzY
         3HFnH150MeV1xEq2vDQHmoQ+nbxdGJq09ZWQ8tfhvTI/b9FaCHPzj79WFy12EE+7DYv2
         GYMw==
X-Forwarded-Encrypted: i=1; AJvYcCVCXjs3ag2TPI/ic0aQlUnRtK34llFAWpus4g/QfB3gtv0jQb6LvDQ7eWUXMXvHpJaKYVFiNtCYMa/64/gNxH7I
X-Gm-Message-State: AOJu0Yy+JjWvT0JdT2EQCwG2UJCMlEgARBQGJVtTdcvcEgHexM51ojMO
	U3Y9CIaPhM2FD8Yzrak0ZSMwWPrdGDQPZCrxPFTahaPIkS4n5EmvS1rLgaeI7MWEv5IbwvEwZwY
	R7jx98Q==
X-Google-Smtp-Source: AGHT+IGD/BF8B82QHszYTuxyXyG3P9npaIZ+RlhUy/ke6xJFD4mLmTkHFH3KsIJPsMFlvhOKht3iCg==
X-Received: by 2002:a17:906:29d1:b0:a43:af44:9147 with SMTP id y17-20020a17090629d100b00a43af449147mr864403eje.5.1709081007999;
        Tue, 27 Feb 2024 16:43:27 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id cf18-20020a170906b2d200b00a43fc28334fsm62099ejb.27.2024.02.27.16.43.25
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 16:43:26 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so58653866b.0
        for <tools@kernel.org>; Tue, 27 Feb 2024 16:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkGYHcmgsaO22/5tNIXerBU2LG0fELqK7ecbKrZf/pWlnl0kirwSeveVTjdvFoWkvQNOR/7ewavPbPNVxdi7Zy
X-Received: by 2002:a17:906:4557:b0:a43:1099:7e72 with SMTP id
 s23-20020a170906455700b00a4310997e72mr772552ejq.35.1709081005598; Tue, 27 Feb
 2024 16:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 27 Feb 2024 16:43:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
Message-ID: <CAHk-=wixuZ3SwabT69MEt6=c7hTJ=s4ptVDSD6UKtP+iBANy1A@mail.gmail.com>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4 integration)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Feb 2024 at 14:32, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> So, the question is -- is this useful at all?

I find the demo intriguing. Useful? Who knows, but the potential is
certainly there.

The summary didn't seem to take Rafael's last (fairly strongly
negative) email into account as much as maybe it should have been (my
first reaction was that maybe Rafael's last email hadn't made it into
the summary, but going back to it I think it was there, just not
nearly as forcefully as Rafael's email read to me).

I personally would find it more intriguing still if it actually
reacted to the code instead of just the discussion, but I suspect
that's still some way away.

IOW - interesting. But hard to tell how useful and how maintainers
would actually end up using it.

Would it be something where when you bring a new developer into a long
discussion, you'd introduce him with a summary of what has gone
before?  I'm not sure what the use cases would be in practice.

           Linus
