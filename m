Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38371;
	Tue,  1 Jun 2021 23:44:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF363613D5;
	Tue,  1 Jun 2021 23:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622591089;
	bh=RoB3ampBhgBtk5hLrimLlgXImtmoHsEIruetIuGkzDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ae4EyUHw5SOB/j9mralU8gC3z2FkWbD9oeZ/iC9RovN6yAvTyRuVrcKvodal4d3ps
	 sDzDfUXVXqveB18XxPEgb6duqyOJTbnCTiydF46ucPxad1l7TNhbF860fOR3BM3rjk
	 uWbecZBlzAreEfsVx3ioELEVbuFyPt0Q+FfQX2frZDZTrodSfOzknfmoGVPT4Gy99Q
	 YAHVlsUUZdyRoiZSPzWhM2DlSPB8Xn6KSj4KOzbVkr7/4PY+/IJZYfdooaZA87HIcs
	 vACTTC9BcB0v/CJWBsIyNCBKlg6353hsvhixUBPoN6TcbG/jrJ6SxHha/qsXWmGgzd
	 OlqywP+DstlNQ==
Received: by mail-ed1-f53.google.com with SMTP id y7so679557eda.2;
        Tue, 01 Jun 2021 16:44:48 -0700 (PDT)
X-Gm-Message-State: AOAM533V+LtxTnCBSX2Dorra3nz3o1Cm776dMGTx9tD1B97x9/fzRSpN
	qD8luaLe/FrxhdXD6lJSWavvkIeCUTzfgFHC5g==
X-Google-Smtp-Source: ABdhPJwaWhggifes9tJp03PC7EX/BdQVJG92inVX0dlnJ88IxLK0MG+KCkZKfb4lwIkS9igUnw7rJoovz3soFrJ5EmE=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr35543005edt.194.1622591087598;
 Tue, 01 Jun 2021 16:44:47 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20210601234231.1345022-1-robh@kernel.org>
In-Reply-To: <20210601234231.1345022-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Jun 2021 18:44:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKM-bbTZXhpwAkfq9cOW=h8b_V4-Fk1Z9htMcscxsYyZw@mail.gmail.com>
Message-ID: <CAL_JsqKM-bbTZXhpwAkfq9cOW=h8b_V4-Fk1Z9htMcscxsYyZw@mail.gmail.com>
Subject: Re: [PATCH] WIP: pw-review: Skip already acked messages
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 1, 2021 at 6:42 PM Rob Herring <robh@kernel.org> wrote:
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Time to quit for the day. Ignore this if that's not obvious...
