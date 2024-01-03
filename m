Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA21798A
	for <tools@linux.kernel.org>; Wed,  3 Jan 2024 05:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gIvePo6b"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2343c31c4bso1127619066b.1
        for <tools@linux.kernel.org>; Tue, 02 Jan 2024 21:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704259571; x=1704864371; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVQVO9EOmYgFPwtnBYiLjKFS+Eu4Xi4OjQqcwxLF9Tc=;
        b=gIvePo6bohPuka9DfUG6yI8Vhm749A/wFXWlA0oyh1XyCpRTd9VA93gsAiR4WpNrK1
         S8MXykjr8jmVSKxOcV3AYiwetKsj01x4J2O+uyj8OYKkXB1ZLuIZy8zLI2du3vSoLy9g
         g05h0rEOs+ATXJxz2Yd63SQahefVX359N5URM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704259571; x=1704864371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVQVO9EOmYgFPwtnBYiLjKFS+Eu4Xi4OjQqcwxLF9Tc=;
        b=ZIC97bXNvS6D4CN4M5f4rIoqTW/MoBBqlqcyEJDCA1MS2a/n1nussn/VlomkcaMPim
         iW82KCmvGom9QBn+zzhfSwv/i40fqUkTNJiQOlQL6FLKJoCHLrvyYcg3iMLv+DsRZb8H
         cB26sr2ZpITbCKywTDz/J/m63Ch3t+iQ2lvKSLcNkQTub9QUTQ4xGSlQyFUFu3JZtR89
         IsO29QXYvy6hqEN0SzDOscKFjfEgObhps6hIzCGcQ7f3MO+mFKBZBXC87W4vJOQqfTjj
         NgqG3yLSRzhdWlHFZAS+OeHyitmiCZgFPJIIg0nQ2MCr+FQHsyW71TZrzJyIKm5o1qc5
         XXuA==
X-Gm-Message-State: AOJu0YywurwT6h6Fs1dB0FIN/mchJaHwJ68BCUD1HoXIF0KNCIZ1J1hG
	lOp892T91SZGSMNMrPKOhX3XQhcP6AjIOBWIovkgagg+pFkiZ3A2
X-Google-Smtp-Source: AGHT+IFUb63BeSgZMdJTJW725/O9jUaiH4he6sIoVXsTUg5h7fixs/IvSUrcbl6xhiKIxyCw9ZAonw==
X-Received: by 2002:a17:906:c452:b0:a26:9aec:1a66 with SMTP id ck18-20020a170906c45200b00a269aec1a66mr5061901ejb.89.1704259571108;
        Tue, 02 Jan 2024 21:26:11 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id le19-20020a170906ae1300b00a2798d33c31sm4498146ejb.77.2024.01.02.21.26.10
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 21:26:10 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d8909a6feso20554065e9.2
        for <tools@linux.kernel.org>; Tue, 02 Jan 2024 21:26:10 -0800 (PST)
X-Received: by 2002:a1c:7711:0:b0:40d:7822:ce4b with SMTP id
 t17-20020a1c7711000000b0040d7822ce4bmr2211596wmi.247.1704259570118; Tue, 02
 Jan 2024 21:26:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur> <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur> <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur> <20240103004415.42xndtocu2ggr2a5@pali>
 <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com> <20240102-exuberant-glaring-dalmatian-d62bc5@lemur>
In-Reply-To: <20240102-exuberant-glaring-dalmatian-d62bc5@lemur>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 2 Jan 2024 21:25:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg607GVe6NYrM6wi+ByKdVZASqHnWSOO-ij0f07b2ke1Q@mail.gmail.com>
Message-ID: <CAHk-=wg607GVe6NYrM6wi+ByKdVZASqHnWSOO-ij0f07b2ke1Q@mail.gmail.com>
Subject: Re: Re: b4 modifying Cc-tags
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, users <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 21:03, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> > Konstantin, is that c=relaxed/simple intentional?
>
> It is, the important "relaxed" is the first one (header content). Nothing
> should be doing any whitespace normalization on the body content other than
> trimming any trailing whitespace characters, which is what "simple" does
> already.

Hmm. I have distinct memories of seeing people claim that some MS
mailserver would change tabs into spaces, and that you wanted to use
c=relaxed/relaxed for that reason, but I can't find it now, so maybe
that is just some memory failure for me.

                    Linus
