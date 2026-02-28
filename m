Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A693F2FD665
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311680; cv=none; b=tjaV3Q1Ld7t2+IGBQZe2L1bPgku143ZNW8d8I6+L6yDhotAZJkZQZ33qx3cQr1RvcQGZJnzSo96ISNr4l0G739UqT5+cJWoZLPgRNT7jA3pbf6valpVXdSSOmG+9iReP483JCKw1T7tRuB8t1W5rGu30NtmGVGUoe10Ta7B+WHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311680; c=relaxed/simple;
	bh=25ygh0TtFTzlfr56TaoqCEGQxZEiHAk8E8QyxcQaZ98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fc8/Mu7hyzZfWKxh6Qw2avNJCcLwA6yOP1Hgl4k8bR2b2onSAol9nBJh1O3hQ9zJ9+Ep0uNfmAv+nYv6jT+7RXQBc1sJWD4um60u7jEI7CQhyQPp3ahYCznEyojKH0Bz+0aKao0ZeplJlM+yRzWuBaXShRQSx7hM83CCCKpSh0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxYWlY8Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxYWlY8Z"
Received: by smtp.kernel.org (Postfix)
	id 65C08C19425; Sat, 28 Feb 2026 20:48:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1639C19423
	for <tools@kernel.org>; Sat, 28 Feb 2026 20:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1639C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772311677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBszl/Z23FTPWP+D+5mrw3kyMyyw9zNLc1//iufGk9E=;
	b=fxYWlY8ZX2kIy1RnS3wf2rwuafxMbIgcZePFkWVpZYJ916OGFiuE8fVP59UHkQnOSXW2kg
	CTLJlVoiLGe3HtrSlvng1nMEk1aOZzblwFuuFBLJ3bTHrvLhoMtMt0IvVIW1MxIm/W8/iS
	RDkLPn2C0vk/D+uAEPblBHB2HGksfZw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-Om77KyMXNRycTesZSlwnBw-1; Sat, 28 Feb 2026 15:47:56 -0500
X-MC-Unique: Om77KyMXNRycTesZSlwnBw-1
X-Mimecast-MFC-AGG-ID: Om77KyMXNRycTesZSlwnBw_1772311675
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso35730475e9.2
        for <tools@kernel.org>; Sat, 28 Feb 2026 12:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772311675; x=1772916475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBszl/Z23FTPWP+D+5mrw3kyMyyw9zNLc1//iufGk9E=;
        b=Pye1TtX2D0x90ZYpZYlXWnFaWWmIX5dMlkUMfocQQamJl70TC6vQX+sPAWIPzKzf3S
         7tAHauXhRLp3F3S6Qpm9w2CxAHhqdTKPlbbA6jzcUmc5U/Vk00u5eZTIMteUjTqDBt/4
         RhSrsl7t2TkhV1BLHR0e+MDhYCoeLKhN6lIQwMU8X/VpSwbaeRqbxGasMjeh066fNNOf
         AqAvN7Z0pI4b4CP8QgTB5ypjEmPSpaNgkGXQSsZV10Poq17LlxrHC5/0Lai2PUmE/D++
         3zOA79QnTDr/y/jczi2juPzvXC0ccihnS46Qv70y3+5xw3JdJi/g5TaUl3VxsQGTe+jX
         42Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW8udMZXqin3yxhkeywp1xRrnU/7Vo241QsS5eRqu5tJBqUxXbhJhD+vl4sRm3SXKD4xw/iYQ==@kernel.org
X-Gm-Message-State: AOJu0YyQSme3exo2TtoHmYYgsOpOOfGs8fVNTrGN7qszJVjRqfqDMrKi
	6X+B2DoHZtTqS7SYHGriNFH7mkvHR2Idi3oq0b7Ys1Xa8ppgrnXzMnQQlvxqyV+6C9W4edbxLyj
	VapaXnQULdugy9yEgSFUIaOmKqBuGwKcahMnS33yrfbx/wz1cXA==
X-Gm-Gg: ATEYQzwPFvBO0w/OKMKZNJHMidIChw1dIv44heGlOrlq5QXw781I5eClX4tn3J5QLzY
	4ixzOQbXM+R4o2DkRDhJNsxfHSeW2mSxhgtdg78DIDrMOkWELwvHJTnf23PzCDfv7ScHOgH8wbj
	tuy5YPu8VKOwbhuHOtWe5lZ0SWPMXzDiW/a/nO3KaVNq5yYvFnF1xRlTfJYY7xXklgfCB3uNjAE
	e5cT3Ma+KtKz5rmLyImvZO6/CZztI7xW1JQVbBUy72RWdFWGOY7PP30FOVE/Mq+h0yCRAGdzSAY
	22qsxUgRO55uPQ7/kkT/fBWoCCv8UufUhihEF6eQmiehOa7s1o4FcABksg7pTR619FQfG3ilwbD
	Y9Bu9tZn8lSSN6jppWg==
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr114953505e9.20.1772311675062;
        Sat, 28 Feb 2026 12:47:55 -0800 (PST)
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr114953235e9.20.1772311674463;
        Sat, 28 Feb 2026 12:47:54 -0800 (PST)
Received: from redhat.com ([2a06:c701:73e3:8f00:866c:5eeb:fc46:7674])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7030b9sm243041765e9.4.2026.02.28.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:47:54 -0800 (PST)
Date: Sat, 28 Feb 2026 15:47:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228154713-mutt-send-email-mst@kernel.org>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228125823-mutt-send-email-mst@kernel.org>
 <20260228-sparkling-beryl-kagu-8c34c8@lemur>
 <20260228151029-mutt-send-email-mst@kernel.org>
 <20260228-military-deer-of-purring-c9ef1b@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260228-military-deer-of-purring-c9ef1b@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TBSPJRIADpkSTRe4f7QM88_oKPepZUYQmEYmFL3-ZEs_1772311675
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Feb 28, 2026 at 03:37:30PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 03:23:32PM -0500, Michael S. Tsirkin wrote:
> > Gemini does not take -- before prompt. the prompt we supply can not
> > be mistaken for a flag, so it is not needed by any agents.
> 
> Bah, that "--" was needed for Claude. /o\
> 
> I'll play around with it some more and try to find a solution that satisfies
> most agents.
> 
> -- 
> KR

at least for me, claude works without --. shrug.

$ claude "say hello"

 ▐▛███▜▌   Claude Code v2.1.63
▝▜█████▛▘  Opus 4.6 (1M context) · API Usage Billing
  ▘▘ ▝▝    /scm/b4

  Welcome to Opus 4.6

❯ say hello                                                                                                                              
                      
● Hello! How can I help you today?                                                                                                       
                                                                                                                                       
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
❯                                                                                                                                      
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  ? for shortcuts                                                                                                          21722 tokens

