Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F793C26
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 21:48:42 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id k12so7157081qkj.8
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=QWnxe1Df2C8LCYQat5q44naVReLXV7oZc3+luZzEBDQ=;
        b=dtZmj/xPhPIfzNomcF79h2it5GCa026ppyO/yio3DHvtRE3vc1wW83FySCM5ulFnHn
         szdIgeRnSUw8XHI4wCa7i24RiTaP4HJfJsIx4BXNQCSOkE1uJXNiFWW7050jBUCBj6Au
         twJ7z9dpmzn3ptk3nQDauSmoZAhgJlzDYM0c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QWnxe1Df2C8LCYQat5q44naVReLXV7oZc3+luZzEBDQ=;
        b=wf+yqlbdAF1s4/L1RChryIOcD6iFwGfBr1JGahTp0QMB86s3Ceb/T/5oTd1s2XXdG/
         yFSfDAzR2oZgcoHixePHOKi+yXVW5NPs8JgKup3HBHiv+3trpfMcUBw+VrBuI7ChZVwi
         tLuSWwID01I0WPU8r5ellm6ITyviP2Q+TtjKAMLY/mHmfdEgvnz4tYlDtAu71+WBw+Fw
         QAPMJamCuHkkkoW0fsyjrGu/mi5vU5OjcSwUW3qUhM5hb9+iLxbqilkI/KKWxs5PQzXk
         63UBLm4MGoiMjm4tpa3/nMoZGYxowrav4xBjMzndgAmmYt5pwU+ZH+Dmnyz14+M8x/vH
         lhow==
X-Gm-Message-State: ACrzQf3dEYZip/T08RjX7DTkv8Sny83cnpslmc9yRuX0rSsoqpWLMBO9
	HBw3ZDj83CMiHPt+FSVcy66sIg==
X-Google-Smtp-Source: AMsMyM7VeEjwB2jkTzPT5oxnZlVIYNgYW0QGEDIAxVUfSNqVyPrxhuirQj7ZBBRYAxLOLvtPtzq3cg==
X-Received: by 2002:a37:9785:0:b0:6cf:55d:e554 with SMTP id z127-20020a379785000000b006cf055de554mr3728485qkd.459.1663883321739;
        Thu, 22 Sep 2022 14:48:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id b13-20020a05622a020d00b0035a6f14b3cesm4443160qtx.27.2022.09.22.14.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 14:48:41 -0700 (PDT)
Date: Thu, 22 Sep 2022 17:48:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 is having trouble with unicode emails
Message-ID: <20220922214840.fw7kdyjidsp2g4vi@meerkat.local>
References: <YyzPSrTcGliahL+a@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyzPSrTcGliahL+a@google.com>

On Thu, Sep 22, 2022 at 02:10:34PM -0700, Dmitry Torokhov wrote:
> Hi Konstantin,
> 
> It looks like b4 does not like non-acsii in emails, and fails for emails
> like "Marek Behún <kabel@kernel.org>":

It wasn't really the unicode, we just weren't expecting to receive fully
formatted addresses like that. E.g., this was fine:

    b4 send --to foo@example.com

but this wasn't:

    b4 send --to 'Foo Foo <foo@example.com>'

The latest master/stable-0.10.y should have handle this properly.

-K
