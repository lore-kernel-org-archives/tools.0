Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB297C
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 19:51:35 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id f8so8300647qkg.3
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFm07xems9qdYYSGMnCzYj0iripbX6LCMThrzJndWyQ=;
        b=KX5RYtUnoZ8sgTwN4gFOsp6BrcyU0O2rVqbjOSwjb4rHRf2uEmZfSe1zPH+AwlaOg1
         DmJWSUQYUKr4kvvjZmdZNyO77c4DQrA5Kdbu2GdAq2y99zPAk0JkYODrkZc3QHqZ/jg8
         JP3JXWSERiQTMY+UwHY1hXm1Kaf33OV/IPUY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFm07xems9qdYYSGMnCzYj0iripbX6LCMThrzJndWyQ=;
        b=g/GtPwYihzkdPbMmCJdwKq3iwIwpMUP21q/CHHa8EQ1jKvkaOP30L3yDZIDK+urjAR
         RUNKy4vrwtkeKhVAADwZVPt4kN6QoZMDCnmJfk1mZtcjdDjh9dE2lRHHmeXhJf1wuqDC
         +a4Dco3F5AHkwG/SP0OITgzCeva0bNoORWjhNNv8ZOWML4EJq4piaPoNzNY44duRdp7z
         aKjGwiZjvNav9RzI+UKIK7LRLqZs8/vqL8nmxQ0BqoUtf4NMBmvch/mooxEzCh8IPwW8
         ic0aP859zVs760Wd8o+6MqKDiObCJmUUG8WrWiPPYrBswv9WCBYhdJKIGLA62X8ypzy5
         LNsw==
X-Gm-Message-State: ACrzQf21X66wcrAXkdB8YF4ikHUq04bE2X36gbXShwW+WZXIHIh4Y5PU
	XK+WHXABN7a4ACOOIHatSrItIj97OCbWXQ==
X-Google-Smtp-Source: AMsMyM4ypiq65mCWgOR1m+wxZliEggDwHsZDFHhUkxwZUsoTRDFMdCxeoz8eZcENE/YFpiTzHWaQmA==
X-Received: by 2002:a05:620a:4447:b0:6c6:c438:1ced with SMTP id w7-20020a05620a444700b006c6c4381cedmr10903115qkp.658.1667245894753;
        Mon, 31 Oct 2022 12:51:34 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id gd26-20020a05622a5c1a00b0039764587192sm4059755qtb.57.2022.10.31.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:51:34 -0700 (PDT)
Date: Mon, 31 Oct 2022 15:51:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [RFC PATCH] Fix 'LoreSeries::make_fake_am_range' with renamed,
 then modified file
Message-ID: <20221031195132.bnezxkjboseihynx@meerkat.local>
References: <e759026c-4f49-cc2a-7885-10b88212d20e@gmail.com>
 <20221026181159.49623-1-levraiphilippeblain@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221026181159.49623-1-levraiphilippeblain@gmail.com>

On Wed, Oct 26, 2022 at 02:11:59PM -0400, Philippe Blain wrote:
> This seems to fix it, I can send a proper patch with full commit message if you
> think the design/direction is good.

Yes, I think this looks good. Please send in as a patch you'd like to see turn
into a commit.

Thank you!

Cheers,
-K
