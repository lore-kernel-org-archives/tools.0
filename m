Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DC279DC9
	for <tools@linux.kernel.org>; Thu, 23 Oct 2025 06:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202791; cv=none; b=I2fQIaEe6rXd8eZWGh8HscHJx/12DUDx3x2NJaXqxG6kvCJ60njzDh6OkTUw0K824LYt2P0zpZwF1s4sQleAAtg/vF1Oq1oWbsHFG14tQd0sfe8Yv7bYhYh0JnbASgu1lh4hPpc9OUknpKWPXgwJcEasL5pIGNgnJ50EO1MKhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202791; c=relaxed/simple;
	bh=7BW7mJi7dpub2e9rGUMqs91IUO117Tl3e0LbM9uWduQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFbNgL1nXAMXMuQo4egyyItoviCPJh19GEynNcoH00AzB0Q2uFanMOgae6qloVBZKao5jP+5B9I0aOo5xkV1OplDZcmQQe9Jc5a/77b0S8eQ9v+BjvbcXGoyUvNCN51k3A5qMWmivEoZ3e5z9FFryIufPr76TZRyXWLv1IixeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id E72EFC4CEFD; Thu, 23 Oct 2025 06:59:49 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B8BFC113D0
	for <tools@kernel.org>; Thu, 23 Oct 2025 06:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B8BFC113D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5d967b67003so560494137.2
        for <tools@kernel.org>; Wed, 22 Oct 2025 23:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202786; x=1761807586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLuxKLHN9Gk58PMh6QZAgbamwn4QZRZUwpOLFCctrI0=;
        b=CXbKXMAWv8xA+ViJeVz3xJl/8c9PxH+DDbbhmMP9/22xCkZIrPH/Mvit3W694gEbdu
         9q87WUJqS+E9hsQnjGdLDWS7poMgvDhYcYNOuZr+9lPjPDiBeP15HUWgWpb2XiHFBHsi
         XacsKyry8uaKe47LAhbiVz1mVZRZtqi4YPAvbRkj1/Z7gSS49tJKLxi2Fn4GN2bEZt40
         bkGHAGNixQ4Up970ZKyJ0dHTfUlTVkBztn5AznVD2LjvHMJCqI+h99/4XJkg8VrZwtND
         +5kE9DEUtMXwH1ChOAi7Pjzgd4AZNG3Wr+C+loKQY5yqQbrtuM9zjk726eE08O3mBt9b
         2XAQ==
X-Gm-Message-State: AOJu0YwngrxnrHqG2d//3WbiLJaa6AgmAPCkrdVL74I/NWcU6LJLmzjt
	U2OrC5Rrvr7MH9wW4bW8r9dW8jk2/7hitSdWVg9E/Q1f1Pa44W667brCm6QXfKZ0
X-Gm-Gg: ASbGncuTEk6TNHZpgC9pqfjEAxc+E94WlYIQuANpyHY95t2Lyx9UDNplTn4/1bF9bv5
	f9z2qXVWm4J7BJqc80vwHJZC5/bY7PFIye7wMj1Iz9cT9dwsiT4t7CT/VcgYWxZ4u/iwyIh2hOA
	L/ab+PGR4sXnqD1uq24iydRbWs/DrbQNMYW0Xgr1J8JLGznjuFfkAsZiqm5tyI46r74P8v9i9ZS
	iSiqvUioiB4Rbglsg5anks27+BNBKwQBpnD4yg49/eApefyGchRcLGrw+mGipZr3FrKVqV8Jw8S
	Wqzmr2STQ3z6y9Ocn6tOipST9I5ODlrEagNConNpMkZzUSAEDD3DbER9fVEXMlKCIrNdndBzo7v
	d8+iPs9eL4DGUVr2+DuHQW/m+OEGYA21qwNSXjDqPkpVYYP4cEFg13CyPffcxGUo0IevFgPzQLR
	IOpdRjmFYxmu9jMgtFVwhF8EM32q+uuQN1nhJVy70CS5fqTsGA
X-Google-Smtp-Source: AGHT+IFsIBruqDoYQMW8PVcxXKIE4hKm+V8bZtBUpPocumfKxTfrTygcKn3cH3hOTl/2bceXutOGuQ==
X-Received: by 2002:a05:6102:e0a:b0:5db:32dc:f05b with SMTP id ada2fe7eead31-5db32dcf9a7mr159595137.42.1761202786027;
        Wed, 22 Oct 2025 23:59:46 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c77c69bsm567521137.2.2025.10.22.23.59.45
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 23:59:45 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-580144a31b0so242891137.0
        for <tools@kernel.org>; Wed, 22 Oct 2025 23:59:45 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-5d7dd6d63e7mr8381840137.32.1761202785377; Wed, 22 Oct 2025
 23:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdX40JoouK0yjm_-ggj5dQ9MtE2vrYhUOQ9dDpCN-0+tXg@mail.gmail.com>
 <20251022-b220661c2-de130d3d7a44@bugzilla.kernel.org>
In-Reply-To: <20251022-b220661c2-de130d3d7a44@bugzilla.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 08:59:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEgMCpHCSXESf4vT+DthDXg12Nq87ZaJ11J9tVV3+5Mg@mail.gmail.com>
X-Gm-Features: AWmQ_bkI3sztNYNOzxG-IkFz0fAl3QqZWq5aueaXk8kYNbFPBxcwgb5P76fbS_0
Message-ID: <CAMuHMdUEgMCpHCSXESf4vT+DthDXg12Nq87ZaJ11J9tVV3+5Mg@mail.gmail.com>
Subject: Re: b4 am no longer prints file name
To: Bugspray Bot <bugbot@kernel.org>
Cc: tools@kernel.org, konstantin@linuxfoundation.org, users@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Wed, 22 Oct 2025 at 21:55, Bugspray Bot <bugbot@kernel.org> wrote:
> Konstantin Ryabitsev writes in commit bd7332f9094cb0c113c228f996991f2a42e641dd:
>
> mbox: restore printing out of filename to git am
>
> Looks like due to either inattention or bad auto-indenting, the part
> that printed out the name to git am ended up buried inside the if
> statement that is almost never called.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220661
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>
> (via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bd7332f9094c)

Thank you, confirmed fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
