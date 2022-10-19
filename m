Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3553A3
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 20:29:31 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id o22so11521640qkl.8
        for <tools@linux.kernel.org>; Wed, 19 Oct 2022 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DbNTh8vGnatuHv6yB/7MFLTZ3iZ9NlrG/egKQH42YU8=;
        b=GNe83dOkRYZRovbzVV/DFmgQVCqxNqikSWELq2F3GiPAcni+acuZ5Heb1viSAU8QwC
         pb8HMXiuUeSH7EXpPZka9FN7iXGiv3DIIYQgg6ZuB1x0iuAr0StqX4h8zo3LLx/K4yAR
         KIBTBrcQ2Ym6cHoPPqB99xznDU5M0Yv0j4ifI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbNTh8vGnatuHv6yB/7MFLTZ3iZ9NlrG/egKQH42YU8=;
        b=kBOq+2UXsOXbABN65G9ahCuQUXrh+1W3P438da90z9VYedWxbJT2x+WwXmgEcVe1v8
         V++IWShxIDOMDSTi+8qoDiTI7rHM8koh8rd27VP9zNpYNyLX4u/NjRKNITGE8PF0SHR6
         nA7h1yt4vqBduhAZhwkKMhuw2OBmwYho8STnfx+BLJPNPSc2i2LFe84k99hstzEm2NFJ
         VZyMn2aPHz99O+RRH8Q/7sO6E0Gfug46VUpy7ithFU3tVqFgZfAazEBCEZY1bEwzbKzo
         OTp3yXGoKB6Xe8D0/YwRqnkeDoAj71MrsT/eGP11Te1J9cSVqm20EsP/DMQRIaSw/uQp
         N/SQ==
X-Gm-Message-State: ACrzQf20LTRnekfjwTOV399yg8WPhQagTx3yw1RJQKIx6tJGNBfjFwkE
	1zmEoqxG2MFVMl45735EvmtXbg==
X-Google-Smtp-Source: AMsMyM7s9W+ij8Lhm1CRHqdtC5DjbCDgSKY446hCNKt/PMmSFDIgL1fcCfgt1RItyh4kWL/nlAG+CQ==
X-Received: by 2002:a05:620a:1a99:b0:6ee:c795:46a6 with SMTP id bl25-20020a05620a1a9900b006eec79546a6mr6929015qkb.286.1666211370972;
        Wed, 19 Oct 2022 13:29:30 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y13-20020a37f60d000000b006e2d087fd63sm5527252qkj.63.2022.10.19.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 13:29:30 -0700 (PDT)
Date: Wed, 19 Oct 2022 16:29:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: "b4 send" crash
Message-ID: <20221019202929.gem3dvm4ulalnla2@meerkat.local>
References: <20221019193959.GA34903@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221019193959.GA34903@bhelgaas>

On Wed, Oct 19, 2022 at 02:39:59PM -0500, Bjorn Helgaas wrote:
> I think this is because I ran "b4 send" on a branch without having run
> "b4 prep" first.  "b4 send" works as expected after I run "b4 prep".

Thank you, there's a fix in master and stable-0.10.y.

-K
