Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F0528E1
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 21:37:04 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id c3so4078510qtc.8
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 13:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2GRAlC0y8VIHltNzi+Wl/NoJdCesn/0RLg7Kt0exLw=;
        b=KrPOKCvvkwFfL/MbFNydfsxod/g4oN9nr3j4Tcw4yL4nzkTJxMt1ImUFNxVGtITpGf
         hn9m6cEOyUwpYKiLr1EHwZ9i94Cs/qLJbXAZdxIhRuT21VYKZtAkfZABx5vJek/GoGEj
         qPa+L/ujl1ACEOXmDrBn+OypVcCaD30IJsWyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2GRAlC0y8VIHltNzi+Wl/NoJdCesn/0RLg7Kt0exLw=;
        b=eD4bonVC1Hddv85zj5wybU/q2ZcOFpzJfVWQLOnYqo7jCjDvgyvzkOZhKhr+062DiU
         mr2JF7lkaHnSb2cV+rq3C3/NUlQoQT+r3Tp69KEqRe5Pz3xUnEd9AeJPU/dWi/Z+V/xN
         Nry2nSZusDmQuaxfXLticqpuRe1AMe6bh5bPuvw5sFQlvMi4TXCpqDiLvdvXRt/n1aSH
         o3jrfDFQ18E/Zgb3gDeeQ6M00uE/9Vb4cfy3sK7Hxo0Cpvtqc5wp/isOAHBUn4ClLRMi
         Qrl5vQ38IRe1chMGUREQkO4Moh5WHVKEltH2TqTN1nMhFuO4WrGwEzM1ybZT7JrpzUFA
         ldjg==
X-Gm-Message-State: AO0yUKV/V9phkQubKw56gJNDDyrmp3ExISTO4QMZbfLe59sJOT1vWI1s
	JgDAvifdadn1hJSLwvgquS1sHiFzq4JXdygp
X-Google-Smtp-Source: AK7set+5ATY+TkZIQO8hiSeAyT6sCjwaPvYcS2vyt4v788ME79R3mEa9n4S4r1YDdkfeacnJjjoYrQ==
X-Received: by 2002:ac8:5850:0:b0:3bf:d6ad:5236 with SMTP id h16-20020ac85850000000b003bfd6ad5236mr1350892qth.32.1677533822965;
        Mon, 27 Feb 2023 13:37:02 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id t8-20020ac85888000000b003bb8c60cdf1sm5445600qta.78.2023.02.27.13.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:37:02 -0800 (PST)
Date: Mon, 27 Feb 2023 16:37:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>,
	Philippe Blain <levraiphilippeblain@gmail.com>
Subject: Re: [PATCH b4 0/3] ez: allow sending all versions of a patch series
 in the same thread
Message-ID: <20230227213700.5daxue6votxduicp@meerkat.local>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
 <167753375541.1113499.10387934728460538344.b4-ty@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <167753375541.1113499.10387934728460538344.b4-ty@linuxfoundation.org>

On Mon, Feb 27, 2023 at 04:35:55PM -0500, Konstantin Ryabitsev wrote:
> > This series allows that workflow in b4 by adding a '--same-thread'
> > option to 'b4 send', with an associated config option.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] ez: allow sending all versions of a patch series in the same thread
>       commit: 14a6165754778b83cdfb0b546f5bf23cecb84744

Hm... I found a bug in my own code. :) I took the v2 of the series, with
slight modifications (which is why auto-matching failed).

Anyway, v2 is in.

-K
