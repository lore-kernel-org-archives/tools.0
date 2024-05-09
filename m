Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6215EFAD
	for <tools@linux.kernel.org>; Thu,  9 May 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715267354; cv=none; b=iF9KUl/URdixQ2AqpeWjkZwLDE8PeFBpWCXoNYUHYO4hPkIcpWJpVjjT+dVEtwx8LPppBOPVbsD1Gs24M1HJZQmguYxeXQ/j4ufC1npc5/maV435nZBrvVy22y0g8VodMzVrA8yyjDbFtFcAIjfPxn6SzZyCmpNxCs+d3IajyOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715267354; c=relaxed/simple;
	bh=czyumFDrYeQE4eKWQaVxudRDJfszig5NhGt3GDKLZ1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQK+X6jnyVBM+/JOF9vCnZO/neS5ZuKSe4X8gbvOA63couh5ETnCI9SnHLkimu/ysEfOuf3KpU3liD3FYpgT8cDul8LwUjg7SJ3pQ89x5yi+VOnmHE5PLujATcC+XW5hwnEgUOxLLcJ6Rz0rQvnKrdexgue19dqADCT9p9ec8D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=sfRQEAxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="sfRQEAxs"
Received: by smtp.kernel.org (Postfix)
	id 64283C32782; Thu,  9 May 2024 15:09:14 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81D18C116B1
	for <tools@kernel.org>; Thu,  9 May 2024 15:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81D18C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43df751b5b8so3628011cf.0
        for <tools@kernel.org>; Thu, 09 May 2024 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715267352; x=1715872152; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ONOfZgN2yFkxYzy+iUGr7wfxn5DbZQlfz4lpChh7JoE=;
        b=sfRQEAxsP8vNG7v9iUGRnl6hsVbynJg1gZYY0bukZO0BDwww8UoBeCvKtsbJl3f09p
         Nz30nEr2A7IIRqyJPd7pIU9NvB/0ZThjs8infRZZVMle3RUEunjS3IGTV2fxRFcN7OR7
         s4aImd7AT+C3TIj9+UQcw6BDy5cnCyDE5tAtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715267352; x=1715872152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONOfZgN2yFkxYzy+iUGr7wfxn5DbZQlfz4lpChh7JoE=;
        b=E9cuXLNfagv3fQQepb+D+njWCuTjKp9dqn8QQ0s0JC9+qV7DNBLSzzxKloeWUio8lM
         gGOrm2aEuzasxQ3MKgtGVQhyIkMShSWaFUKTrGAvYrS3iEa+3eiCl3T/9mEj5XkoFdK6
         oS3p+VEL3MZB5sbURLsCvtbCC31vjk+l1Tx2Rz4zZLkDGbeVxChXeE2iPwknrYLNMM/R
         2dR3NTk0DPA0qVxq6HZANUQYOPq40sv8ixVaTmFDVUA1Wc1HSjHCYbQNZn+JxUVtDA+7
         1R8mhulfbV70T4Cw4WRxKq7APTDYD5q55HbfUCVtmTgJzdDcDPEfz5lX1mMiJTNek4pA
         RGaA==
X-Gm-Message-State: AOJu0YwS+gHQl0wv/gbsuEeSWHuSMSvlva696bUrDgbqCDvopgNfQrSg
	DKh8ljPbb+nniJO0O5rtRhMD0twhFGTIuej2YKga/Bz4IL3j99MiU3brSCnjglKn36sI28N/CU6
	h
X-Google-Smtp-Source: AGHT+IHXGPpzuHobT+0ZACU3MrmZMoGGslbK0y74zvmf7O729HEO3wj4/qs6ATFE9RRFYDXuyi5enw==
X-Received: by 2002:a05:622a:109:b0:43a:3502:8446 with SMTP id d75a77b69052e-43dec39be29mr51212381cf.28.1715267352280;
        Thu, 09 May 2024 08:09:12 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54d922esm9131541cf.22.2024.05.09.08.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 08:09:11 -0700 (PDT)
Message-ID: <8e15d308-b528-4cc1-b90e-1cda2fd05678@citrix.com>
Date: Thu, 9 May 2024 16:09:10 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 shazam not stripping ---
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
 <20240509-elated-augmented-tench-5fbb9f@lemur>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240509-elated-augmented-tench-5fbb9f@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2024 4:05 pm, Konstantin Ryabitsev wrote:
> On Thu, May 09, 2024 at 01:05:40AM GMT, Andrew Cooper wrote:
>> Hello,
>>
>> b4 shazam 33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com
>>
>> is leaving the notes under --- in the commit message of the finalised patch.
>>
>> I cant spot anything obvious that should cause it to be mis-recognised,
>> although it isn't a git-written diff.  Reproduces with 0.13.y and 
>> master.
> This should be now handled properly in master. Thank you for the report.

Works for me.  TYVM.

~Andrew
