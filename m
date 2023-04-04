Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0216D6D22
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 13:42:40 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id t19so31509462qta.12
        for <tools@linux.kernel.org>; Tue, 04 Apr 2023 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680615760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trOFB4FMT27Gz7g7cwrI8psspwO2W98YTqeN10Td/Yc=;
        b=aIqR1Ujtro+MJ36ZE6lPKHZQnyZcNX6kRRNgDSdsCBkWojDVIGZj8QbC71Bho77BYI
         4f/OUp188p4AQQWZpH80/5gCc31OW/i5aSM79jWcMZLzSc5L5bd4vgSulEnLgAhBJgTC
         8d/1D397JI6ARwhb3FT6qPylsouRhJR80vmdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trOFB4FMT27Gz7g7cwrI8psspwO2W98YTqeN10Td/Yc=;
        b=UqJhd+aydOZgZsRB0TPgZIa5ShxuQZ9ssYq+l1tWnEZLCf5mhefAEOEMFYgr9h9ktg
         VfuIg4f6BX2UjLLyfoxBgLX5J/waYCQsBS5nCFBuZHs7xa919K7d79mrjpKw8Dkqcqbo
         99csTG/FxE0ZLkskVXyFnuxAIS6a0hZckYBmoWXNHaE/aEUurCy/pSV22MKV2k1v+TsG
         BSgFyeAdTA+3m0o2hr4BlMYpZ0M48ivAmanv1/bYPDK1gOdpN+n78Tj6pOvMLaoNOAMb
         weLkl/C/tcusZD7lB4AlBaL3RE3+XrDaRs++Sst9MZMUE9QTzFQuYASk5x04gHgtgTaD
         WvCw==
X-Gm-Message-State: AAQBX9d27/SC176hY9JBjSR9RelMpaz87OQsW8iIr+T0vbSN8kxiZ5uM
	h+KAYqitEpCIoaIZq4OzSJR8KQ==
X-Google-Smtp-Source: AKy350ZAnzR7J7+qvP71WKD79lA4j8OYXEVSg/TUAh+gL1guSN9jkVifZa2+WtB8aYaBJ6aPJJI4HQ==
X-Received: by 2002:ac8:584d:0:b0:3bf:c9d1:4276 with SMTP id h13-20020ac8584d000000b003bfc9d14276mr3734954qth.5.1680615759589;
        Tue, 04 Apr 2023 06:42:39 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a280800b0074269db4699sm3594343qkp.46.2023.04.04.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:42:39 -0700 (PDT)
Date: Tue, 4 Apr 2023 09:42:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 having trouble parsing recipients from cover
Message-ID: <20230404-tummy-lusty-057598@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
 <20230404-bacteria-refinery-a97393@meerkat>
 <ZCwlhTvZhpVXBj6/@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZCwlhTvZhpVXBj6/@sirena.org.uk>

On Tue, Apr 04, 2023 at 02:26:29PM +0100, Mark Brown wrote:
> Hi,
> 
> I've got a cover letter commit for a single patch with the contents:

Does it work if you add a single line title at the top?

-K
