Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4C1514CE
	for <tools@linux.kernel.org>; Mon, 22 Apr 2024 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713796076; cv=none; b=II+fnC/0/hB99QdNw+oJ7SzFwmLvElituR7qsW65rotp+eVYVqPQWdV9aGiMn9rNQbOqrhTmqHfCr88vTEYSflXu/3P8RjdDWWKtpaCAPY4Cp32O5zzrOUwlt82u4dDaFIkFupSHZZL7wk1qC/qYJjRmmntCXmq5/5FXcHnx2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713796076; c=relaxed/simple;
	bh=UNBjOTY0qs0uiF8EORx5BtyTGJtQ6MyutJpELBAOp5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XC+m0Cp7gjDUI+hSSSh1RgGNhWG/Xv60d7HMDLfboJrc+/yl9PB4QjYhqKUj5dH84fVN56pmrHkJfi1P3BtS/tEPWL3dlEZhWXfjkPE50LCivIHxNunACul0rDfvBdmUss7lKbiSPEcPTQXokpBgr0kXURVAP6yTt0hw+oGMfDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHOl6y0z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHOl6y0z"
Received: by smtp.kernel.org (Postfix)
	id 21DD1C32782; Mon, 22 Apr 2024 14:27:56 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36402C32781
	for <tools@kernel.org>; Mon, 22 Apr 2024 14:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36402C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d8b194341eso42467461fa.3
        for <tools@kernel.org>; Mon, 22 Apr 2024 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713796072; x=1714400872; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNBjOTY0qs0uiF8EORx5BtyTGJtQ6MyutJpELBAOp5E=;
        b=AHOl6y0zz8dAeFrXVhGwCcfQb4U1iv7Axru8ewUOMh61px7cNBofAW6nva7JD7ipZ1
         UgghO4vsf3WLIf5nWfRiQHHjPkHdOras8tFntiEiqA2/1h5YaaeN0CYZGhYN6TGnfvPz
         jtYy026uhqa7JN5AsEbeWWPE8Tu2PUhQDLzSw0wEBNVYBvCZ2teQ08E0aNroJK6xORIZ
         8AIE0PRgaZCnvufqZjyTk9ARWO7H6ft/fLwT/e8g02I0LykFQbH4t2Z/9A0PPRsm6yKL
         4dprXDhiackO7FjbKzCOjEuG9xXk8QasIMsRdxcJfERAeacxKZzpUKeTH6gVlg5F/09X
         UoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713796072; x=1714400872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNBjOTY0qs0uiF8EORx5BtyTGJtQ6MyutJpELBAOp5E=;
        b=KYy1U51DCWdOGrsoDPqxm0aEqTEk7LD0xHszwgx4A50JhN8U0FiWqvhLUboItYFPIf
         cTV17p5pDWLkFEhuUaLt8GO9EvBSdlZmILIwxGPzGwgIqVePONGHDfARgxE/qK/Co3f5
         aW48ysqmN0x+5GhSMOyl3VQHbe6lA1NIHbxkAXp2JvScZPYUC4CTiw6bkzXR4OnjYF0k
         Shml5IteGFm0ieUVzTuhx6rsvPhAQkd/uUlgwBhSZN6UENRqYBXMQOcC80KME1PkzxQS
         ZqHTPdj8sqg0j1ymNAxHhPFcJlGuaDSv+OqpCexUUsw6GZBFwKNWpXMqGAooSZaGRWEd
         VGew==
X-Forwarded-Encrypted: i=1; AJvYcCU4C69FSKMc1it9BKsvokQEQewTw7bfdfWhTeIjlYOQJboYqrz6MnHrdxwSD2kWXmaqo9BqDg3m0O2UY5VHHQ/i
X-Gm-Message-State: AOJu0Yw66IE8bSF/u2csEBscGZ5MJHZrYY8n55kpaaMkjX+EWlSMjQi1
	9uCQ/Nx84Kd6APNXADBOoeMeC/JsBL2qoM6etgM6ZaoHslHsHep47AeP/hed4zM=
X-Google-Smtp-Source: AGHT+IEkN6CNdQTBKxKxXZBn2HlML3rafBsTIUTuTxt2ocrHVbXK17h0QDhg5Z61h1NNgJ6JKtrQow==
X-Received: by 2002:a2e:805a:0:b0:2db:99e4:dbdd with SMTP id p26-20020a2e805a000000b002db99e4dbddmr5541085ljg.53.1713796072319;
        Mon, 22 Apr 2024 07:27:52 -0700 (PDT)
Received: from [172.30.205.46] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p5-20020a2e93c5000000b002dce3eab848sm1076631ljh.47.2024.04.22.07.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 07:27:51 -0700 (PDT)
Message-ID: <36a1ea2f-92c2-4183-a892-00c5b48c419b@linaro.org>
Date: Mon, 22 Apr 2024 16:27:47 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] sysctl: Remove sentinel elements from kernel dir
To: Joel Granados <j.granados@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>, josh@joshtriplett.org,
 Kees Cook <keescook@chromium.org>, Eric Biederman <ebiederm@xmission.com>,
 Iurii Zaikin <yzaikin@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Balbir Singh
 <bsingharora@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>
Cc: linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, tools@kernel.org
References: <20240328-jag-sysctl_remove_empty_elem_kernel-v3-0-285d273912fe@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240328-jag-sysctl_remove_empty_elem_kernel-v3-0-285d273912fe@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/28/24 16:44, Joel Granados wrote:
> What?
> These commits remove the sentinel element (last empty element) from the
> sysctl arrays of all the files under the "kernel/" directory that use a
> sysctl array for registration. The merging of the preparation patches
> [1] to mainline allows us to remove sentinel elements without changing
> behavior. This is safe because the sysctl registration code
> (register_sysctl() and friends) use the array size in addition to
> checking for a sentinel [2].

Hi,

looks like *this* "patch" made it to the sysctl tree [1], breaking b4
for everyone else (as there's a "--- b4-submit-tracking ---" magic in
the tree history now) on next-20240422

Please drop it (again, I'm only talking about this empty cover letter).

Konrad

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/commit/?h=sysctl-next&id=ec04a7fa09ddedc1d6c8b86ae281897256c7fdf0
