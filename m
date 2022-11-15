Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9526139E
	for <tools@linux.kernel.org>; Tue, 15 Nov 2022 14:48:55 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id i9so9572941qki.10
        for <tools@linux.kernel.org>; Tue, 15 Nov 2022 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9VrPfzgXGf2xiZYtgB++o+NhB78dyHCnzk1eP3uauAE=;
        b=Aonnv5x4hMbjF+EcEhsSL2o/K+fKvpzQdg5fNpl2RIOEHcmC+oTxrMxNp9djTPHesX
         mKnxD8iAOyn4LXGGm4gg8RsXgFlkta8xVmf9i/eDqVjNSyh7q/ju2kWVy31NG1/wV7Ek
         VqeS9v0MiY3Br4Db+2tqRWsubNYSEmuyuWk3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VrPfzgXGf2xiZYtgB++o+NhB78dyHCnzk1eP3uauAE=;
        b=bK6Z/678aL2CCkZK+CucqJGVONuuqbjorWBUPbw2GMhxfuUOFUMmRwWGaKB1AcDLXj
         LSgN6vlFY61ZwIzN59zgiK7cQulBy9yRXp4X8+dgtaMsw9hPiUBeXb0GXefvTi1nsndg
         4I6g/XLAbWE52eKg9tVK6pSp9jqVA56kKMAlbegJ5mo/FkimOR3fpwVpShqrJWQfIguz
         +NJ/HQJy5fuk98+RlBNofxkTbOSNr6nUX5cNLdFrfeoz1XuWrutBGXqA4yBsEdyJbw7v
         w4PJx3rnC9mZQg0Wchccd1aeKzWEacKkfSwysUG1K+FQ/L+xsCDCfGh+w2h3fmMLD6k4
         SzjQ==
X-Gm-Message-State: ANoB5pl3WUUGgaQPYw7rA3ojiYfRydEox2hbJDzK2BFIVAZb8wXZdWBe
	nkdy7Neecmx+u8tZ2qi7Ng8AxndI0zCfww==
X-Google-Smtp-Source: AA0mqf4lST4MHdYuXRfdbrxCZEoNe601kWJbV1nv75KV3IwOeGb5B6NkwGjRhDJ0ODcPMmWCPN52dw==
X-Received: by 2002:a37:ba01:0:b0:6ec:5332:6ebd with SMTP id k1-20020a37ba01000000b006ec53326ebdmr15669003qkf.0.1668523734523;
        Tue, 15 Nov 2022 06:48:54 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7262231qts.44.2022.11.15.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 06:48:54 -0800 (PST)
Date: Tue, 15 Nov 2022 09:48:52 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] mbox: Add the --pipe-each-message argument
Message-ID: <20221115144852.var6dmyxdft6qvzb@nitro.local>
References: <20221115032439.24876-1-palmer@rivosinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115032439.24876-1-palmer@rivosinc.com>

On Mon, Nov 14, 2022 at 07:24:39PM -0800, Palmer Dabbelt wrote:
> I've got an oddball mailbox format, so rather than trying to directly
> encode it into b4 this just lets b4 pipe each message into a command
> that sorts things out.

I'm not sure I want to go that route -- formail already exists and does it
better, e.g.:

    b4 -q mbox -o- 20221115144005.2478-1-johan+linaro@kernel.org | formail -ds grep '^Subject'

Would that be a suitable approach?

-K
