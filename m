Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01ED441A
	for <tools@linux.kernel.org>; Thu, 21 Jul 2022 13:07:21 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id n2so1194944qkk.8
        for <tools@linux.kernel.org>; Thu, 21 Jul 2022 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jOYse2ryixYdyzu3sGT9a0QWZ7V+kb3j8EXOT7jYzQE=;
        b=oiNKTXvUMWiJlvghpYKvlrJnF5+FUMUh8XF74gT3keUK7vHsSfvlmHiEfFz4I6YxAf
         p8/3dKMO2pXU7/HZmH18B8fAuXG2+Mr9TnH3gy1gvF6cyeqBWgNIB9jDKDw6UCTb+6lR
         Q39lTAW7h99U9w1TGyVwZ7LayJRh0+ft5CLFgbi/QtGEP9Xk59Byy9ALeMQbkx/XfIL1
         q9wf4NTU5mt6RFHcJ3P0X44RBoRm+KmT/ARa7qBfYjVA1DSp8v2g8aP4zq6RjW4d4CK0
         Dsld2EOcYSHrz/AJ04y3dw8byA7f1Fi8MlQVxRS2j2VB47mSfcvGZ5DWjLKm/L0h3Gnf
         vzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jOYse2ryixYdyzu3sGT9a0QWZ7V+kb3j8EXOT7jYzQE=;
        b=YRftHExaQOVZZ7QvOu4sfqXZz/AiCRAg77o+lxoL+qJb8o2E4Dgya7bAPjeC7h3vyx
         12gYomXspEkOqwb5N6MHhwXeeN2APr01FWcjVPjJDrmkNnaxT7E/Wv0Aspowd7X2hglB
         gIRU2IbJtE5IO9JtUpCaCzCZx2WDiO0VDEXrKT3PFDera6Tuh2nLRyvFF/kMr/Rvyuyy
         ZRz7LogsWU+QFutirK1CBJIFP3elEC9L+5PJb3h/ob8cV5y7xsFSzQVckWcZazBAoLXU
         jWjjnNmB/ReojLQVkSJm4TCendK01YdfoJpH3lAwVgqAm6GGbFeC5Ickd1UPEbE7Ftu2
         og3Q==
X-Gm-Message-State: AJIora/f53wJmM4zgwGPKo7t+l/OOoxmPzJrclGKfqKns4BXnpdKglE2
	Xkt80FkKu11XqoyRuzxcq9P2Gg==
X-Google-Smtp-Source: AGRyM1u4pxQpedT8zDrIpNJwF2M09lzefM7OW1Q5Y0ZPXum1FGc92uwnJk/sSCSm+RXJ0+uKGc2Lyg==
X-Received: by 2002:a05:620a:4546:b0:6b5:f144:68bb with SMTP id u6-20020a05620a454600b006b5f14468bbmr12074062qkp.253.1658408840352;
        Thu, 21 Jul 2022 06:07:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id c8-20020a05620a268800b006b5c061844fsm1335685qkp.49.2022.07.21.06.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:07:19 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oEVte-001s3f-Cs; Thu, 21 Jul 2022 10:07:18 -0300
Date: Thu, 21 Jul 2022 10:07:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Chinner <david@fromorbit.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Junio C Hamano <gitster@pobox.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220721130718.GT5049@ziepe.ca>
References: <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca>
 <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com>
 <20220720233940.GO5049@ziepe.ca>
 <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
 <CAPc5daWCm=8Bket5t9Q+SJ+6pRL3PPSYVqU3Z98miKV+D_bFFQ@mail.gmail.com>
 <20220721000256.GS5049@ziepe.ca>
 <Ytijr4YQn1OB88P8@mit.edu>
 <20220721023113.GO3600936@dread.disaster.area>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721023113.GO3600936@dread.disaster.area>

On Thu, Jul 21, 2022 at 12:31:13PM +1000, Dave Chinner wrote:

> However, I don't use that anymore, because updating the cover letter
> as I work on the series turned out to be a PITA. 

Can you detail how it was painful?

Jason
