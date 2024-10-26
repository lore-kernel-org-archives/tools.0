Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8C538A
	for <tools@linux.kernel.org>; Sat, 26 Oct 2024 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729960236; cv=none; b=dC8aTs5T2HbIxbHKS9vSRPjGW2WoKpyHp4OXKsuPBqWKtqK6MHC9S1NmSTSTZ1E/VHRySThRX0m8tkcnR3LDlyvLuxNIoQzTwqwEgY9nsBOw9fq9C+09Il2NX6+WAxmat25eTfbTz5WkaF7cFTAjc8T/taWPCgD4GgQS1xFdCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729960236; c=relaxed/simple;
	bh=kkXlqGx5ZmKfN8+Tnnrn0wEMfSTDbbPI7b+BkriSiEw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XtncxeMdsMrifXRcbtf35PUyKa34d1iB99CPGFx+ISxV/AZKyY2Jg4wh8DILcNEPr3B2dQYy8ymcJkcst9bpUMkRGaOINJZfezdE/9QMmNhC3Izm2Nu2h/lX1QAh/kJkzbLDLCLlYU1QzmIfVSnZU7vNqZwb5p+wTvE7yyDj1QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apUVck8x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apUVck8x"
Received: by smtp.kernel.org (Postfix)
	id 3CDAFC4CECC; Sat, 26 Oct 2024 16:30:34 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62BDBC4CEC6
	for <tools@kernel.org>; Sat, 26 Oct 2024 16:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62BDBC4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb518014b9so23989431fa.3
        for <tools@kernel.org>; Sat, 26 Oct 2024 09:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729960231; x=1730565031; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kkXlqGx5ZmKfN8+Tnnrn0wEMfSTDbbPI7b+BkriSiEw=;
        b=apUVck8xCFIq9f7gRHkjckuIaNA4hXTwxaVQdmvcwvjhP8GtBfcDMBONvBAFiPa/Ki
         z+ViI9OxeNaaHZp0BE2mQ3nIFaIqCdy874jap2liKKkKYRuXasimggNkYkrTxGmFVnjx
         po/E9Qi1ob+wrs3WyYxTWLidobfxZAM691Vx72wwFaqCl5MuwsH29FL0XUEZ72xqlQ3t
         ye9DLWsNT9HcA7qhuQYxRxoMJO2HXyy7TvQpZZEomZda7vZQhDPdBT3dTH6uPAIANbMc
         LSmQXIJ70zCuqYxGFIAiCcDtZe699ssSSuZOcZkf8VRMATOUAnYFgJmU4bh/81yRXXVO
         Q8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729960231; x=1730565031;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kkXlqGx5ZmKfN8+Tnnrn0wEMfSTDbbPI7b+BkriSiEw=;
        b=DF1EERnE37c47ehmVhH6/TM8OUlXxSR+iEZ09VmLAGNzOjir/q2pdLPjht8r0ef7nY
         rrLWByy8s/z7bRPSszBGMIA2dB/mXmKCi5FKG0glwwO+3eh5RvnIfWRhTlyKfNfSindo
         bex5nIUswFk8fNI9Pyo1/5d6roJxjpyYHiVxqA3Ib+rH9jOTeX8YtBGCPPVBsS5vmrQ1
         PPVvKlqPCElNWTndMbFULNwKY+OYurQF8wqtgTZKO4AminQYX9RwstHVrJC0XHFPaZ1F
         JEUC77oEeNYDbG/smU7K+UOda7LjigwtTBIBX60/4mikUJC0b57UaJ5P/oYidT1+a6wl
         DoQQ==
X-Gm-Message-State: AOJu0YwJmA2o87y6pxFzjFlgfEEzbb9s3v3Q6RZiANv6Y2qeU1gs/3TT
	b/4BOp29EYqRhd53+/WpdjLfgB7FJvbzOZSxL6esBcZJCIq1mZ2nQFaD7c8bpYAdGeln0lZalQI
	kQQsYSlW7f+/3Gkekls0r9C48eFP47fqSKRU=
X-Google-Smtp-Source: AGHT+IG5RSXuQo6zWZ6EN7h+BsORLfrQgsq3SueO5YMCbpA7Y/DVpzmq2s1RwISsPLUFtG7qcmcNNNuIZ24vfqPLsqo=
X-Received: by 2002:a05:651c:1a0a:b0:2fb:55f0:2f7b with SMTP id
 38308e7fff4ca-2fcbe04f0d2mr11419711fa.35.1729960230988; Sat, 26 Oct 2024
 09:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 26 Oct 2024 12:29:54 -0400
Message-ID: <CAJ-ks9nCK9G7NKPKncZ_29sJZA-=8SNjxZBhY0VacF8PzX8pdw@mail.gmail.com>
Subject: b4: cannot resend after creating branch from sent series
To: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to resend a patch I originally sent manually by importing
the sent series into b4[0], but this fails:
```
b4 send --resend
CRITICAL: Failed to convert tag to patches: No such tag:
sent/xarray-documentation-v4
```

It seems that b4 uses tags to track sent messages but these tags are
not created by `prep -F`.

Is this intended behavior? Is there a manual workaround?

Cheers.
Tamir

[0] https://b4.docs.kernel.org/en/latest/contributor/prep.html#creating-a-branch-from-a-sent-series
