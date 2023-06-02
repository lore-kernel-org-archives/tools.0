Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14018332F6
	for <tools@linux.kernel.org>; Fri,  2 Jun 2023 16:50:12 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6261a25e9b6so20466876d6.0
        for <tools@linux.kernel.org>; Fri, 02 Jun 2023 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685724612; x=1688316612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVbLQmTWsxdy7RU0iztgxPbFW81BRbBrv74VXGA8Nsc=;
        b=JEP9+hu4vnPYpfC7cGdMDDghSgishKvX6B2oXtcaLw/ChdBj9m4PpUHecVzLd+590c
         5mdW8TgKU1ynjA4o9KILNcGaM1H7NmXSXG0xghbsPpJou771gEpt/wBe21JoMAx5uTXS
         1uOH9VLl4Ikq4+AR3E4Klg99ID/ojglllsRoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685724612; x=1688316612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVbLQmTWsxdy7RU0iztgxPbFW81BRbBrv74VXGA8Nsc=;
        b=CasDNvvnRXdXsgrtDw0/rXcoFFEFxTg2C7fSOI12dFrU6IFEbkWzTBQbJlpS0RGI/K
         YgazQkPFfHgOUpu+Ex6QFnVAov2N5t7lqYO+CS1ntPOSVFL3yCDd3GmcQCmlogxfbyrQ
         Bgi+Tkz0Ie87fFVpDm89UhRFAKzk5LyMC3yvqNG+ODnCWKNYsg8IGELigIBzg5MHW7mV
         6//9SugjGC07oaJFa5N/SOw80kvJa78SgPVackl/G4YJDE0/Id7+/k4bnApWthBEcRAR
         QuezEfa0XmDrkLngSG4P1qZRKoHroIas243zgv72GKXghGAwW4FX4Up2VnhU58jUX/TA
         z2ug==
X-Gm-Message-State: AC+VfDzhVVo1CFuQR2fj+j60cYHOmxEdVDp/6l3xTeCm77hCtQgpIZXw
	DhjSZOEmtGu6AYNd8FOjouWong==
X-Google-Smtp-Source: ACHHUZ4eJjb3vC5GFzAcMAt7xk4wVIoSso6YO8bDqTsR0hsfEZocO1DGaUDikugUpne2z2jDUXKKVA==
X-Received: by 2002:a05:6214:2627:b0:61b:6e8a:4366 with SMTP id gv7-20020a056214262700b0061b6e8a4366mr16286949qvb.1.1685724611784;
        Fri, 02 Jun 2023 09:50:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id cv7-20020ad44d87000000b006238f82cde4sm1008925qvb.108.2023.06.02.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:50:11 -0700 (PDT)
Date: Fri, 2 Jun 2023 12:50:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org, kernel@pengutronix.de
Subject: Re: b4: Feature-Request: use salted hash for change-id instead of
 descriptive-name when using b4 prep
Message-ID: <20230602-speckled-modulator-ebdc37@meerkat>
References: <837ab11e-e6c7-0dc6-9377-7889910aea09@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <837ab11e-e6c7-0dc6-9377-7889910aea09@pengutronix.de>

On Fri, Jun 02, 2023 at 10:00:11AM +0200, Johannes Zink wrote:
> Hi,
> 
> first of all: thanks for creating and maintaining b4, it makes my daily
> kernel developer's life so much easier...
> 
> Accidentally I came across a (documented [1]) behaviour of b4 prep that is a
> little dangerous for my workflow: the descriptive-name is incorperated in
> the MessageID and the changeID in plaintext.
> 
> While for most applications this is probably fine, sometimes I use branch
> names along the line of
> "upstream-feature-for-$super_secret_customer_project" (or some other stupid
> branch names [2] - which it at least a bit funny if you know german...),
> which poses a risk of actually leaking information I do not want to be
> leaked.

Hm.. this is a certainly not a workflow scenario I had considered.

> I would like to ask if there is a possibility to change this to using a
> salted hash instead (salt is probably required due to rainbow table attacks)
> for messageID and changeID. If this would break some workflows, it could
> possibly be added as an optional command line argument for b4 prep?

I will consider this request. For now, you can manually edit the cover letter
commit to change the JSON bit there that records the change-id.

E.g. right after you create a new b4-tracked branch using "b4 prep -n", you
can run "git commit --amend --allow-empty" and modify the change-id to be
whatever you like. Note, that you should only do this before you send out any
revisions.

-K
