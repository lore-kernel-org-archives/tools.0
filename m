Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC39746F
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 18:09:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id ej15so1451847qtb.7
        for <tools@linux.kernel.org>; Wed, 12 Apr 2023 11:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681322966; x=1683914966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=etYO9WEoyLvdgLTCKKnYMbb8iAs/i77L5h1VlMaWRuQ=;
        b=GRWdOCr5CJqxVrzqnycW9Amxyv32JrqkuE9g8thPqppwQl9AcsaP9emn2gnWRoNSZj
         UWw4oBQ07rywc9dxbjf2WerWlOiH1RMYvZkH2xzxb38CsVnl//IBFeAwrbFStID/Snkp
         7FWN4WezdZeK/SXK10lqAa1vF/BeWCsIkDUmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681322966; x=1683914966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etYO9WEoyLvdgLTCKKnYMbb8iAs/i77L5h1VlMaWRuQ=;
        b=HothbsbySpx4KnfIGGqOAXka1n4xDRFqkKvlXKkRcbi4Gg1YZs0pqib6MaBo0HvdGL
         tTEfs5dinzKyPPX6A+uFxGGAqinAaJL9JQUzTq8qneJKsBIq1tvePfYQmdymVqnUgE/5
         xp4ocWKXqBCcRx7D/Hcb30QKnhXCTT6+ev5+n7pGZBavP+J1eSBwelf806Usy4a4QuXs
         c0QHcTZg6hoB1y24Z1U4B8eraYcmtkHNXuN8hqMsrqjhbxYod4bHyp0x7m7gHm7pifdY
         XyOgqcCKwnAuUrWPpsraKvN5yxjo/ZWT8rcZGPMIl6PZsMfwIg4xuQHeWOIot7CMzbT5
         wdbQ==
X-Gm-Message-State: AAQBX9dzLOa80kPjgn2lIJDxxO5gYGKzZ9Ol7NIX1+45j4c787Papgty
	3YpnlmPgWC7y2O34TKZjtc1W4ghhd0qaFlKGmxo=
X-Google-Smtp-Source: AKy350bqFgOMav7gUUJfPeoqYzGGwfNOECFrMGwc6UFkbX+vsttYCltf1RA/e+brrmJ2tzwljNlZ4Q==
X-Received: by 2002:a05:622a:1cf:b0:3dc:38e:8b7 with SMTP id t15-20020a05622a01cf00b003dc038e08b7mr11096659qtw.2.1681322966681;
        Wed, 12 Apr 2023 11:09:26 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id 69-20020a370548000000b00748448d9a7dsm4853726qkf.106.2023.04.12.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 11:09:26 -0700 (PDT)
Date: Wed, 12 Apr 2023 14:09:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 trailers --update splats on new branch
Message-ID: <20230412-blinks-stubble-4f40d8@meerkat>
References: <ZDbo/qTKFgBQdWh4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZDbo/qTKFgBQdWh4@sirena.org.uk>

On Wed, Apr 12, 2023 at 06:23:10PM +0100, Mark Brown wrote:
> This seems like it should at least print a nicer error, and I'm sure
> this used to work.

Thanks for the report.

bugbot assign to me

-K

