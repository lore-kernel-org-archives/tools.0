Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FD147DD50
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203839; cv=pass; b=Qj/HuovJaL1cbko2kxdX6nHDwUy7zzTmf3neEakUh2wXaJEMR2D+Xnr2X6R8HxXe9K57jSzXstFUVnnl3Kbrc9Xu8aKEqPyIku5mYPR9wyVtqRn5vI+vpJsquDsH8MPcN/Y8KPb6vWB0baJ7M+iRXBcXkZ0a3+/CTQFzQ6OgJBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203839; c=relaxed/simple;
	bh=exYVVsEuJUbFmpawBGBRBsOEp7NtdhuvLXNq5JBJnuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPdzeLJ7raBWPN6JKomPLnEbstQjJNVso19RNeXjzgSAjqCQ6wPy9T13kYjB0ez+KgaCinpaoqGUl1kDPIp8pXgSRJqIix4IUh1acFr9qgYxvl9o3jLKAlsE8OADM97X325yqv9J25nbhHdzmjtZ2/arr5lcAcUd8sSFlS6lDh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YYuazTkN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YYuazTkN"
Received: by smtp.kernel.org (Postfix)
	id 195ED1F00893; Mon,  5 Oct 2026 12:37:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791203836;
	b=YDcBMhNYehxlpOcttG+9CghMj/LJzW3m6Bq2ufcsvJPtFR91dg9fpaOcjIZACkE67IEG
	 6sNjhiD/eUt2ALZoCm8wBjyoLxT/ccU/ZF7hxEJhsuX69agJkTGaSRz1zm6a+CShgvqj1
	 BfZ+vwkEADlVZs8MswM9pMKUPsYV8GZ7o+aOmfrx4+MjJyQbAe++iOyxKY2yP5lN1IGyX
	 3JDR7WeNRUy3F4SA47AeU5IaJOsY1cjSnVLFJwEt7ANYiBXh6buOJEMm4hQyuotu05AVP
	 3WqhLtsIU1yJUfhxnqCGGKCZq5+Z1It7Qb1I4YdclP9MYF/ndIS7UQK7lrYJ4Cpd94w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791203836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bGlPa27UhVkYPQw5DtghAXle6iXZlIbFDHayalbnIZ4=;
	b=1p6gYohdynEMJoStnfu1dm/KkIUj1Ymu7QvIJCpYhBZaIc5VJTh8oD20/ReGBe19Kxx0
	 fuxi+rOmTv/mP2Hd4WDMVJGLj6lKcw6x0Y7trfrC5ca/bmNu4gHVG/YJ1UeeryjpQq5Cm
	 TNb52nx4c+rYsQBMlvmp/hDwS7tqNJOEKR6laet4g8F5ltqI4WpVpb+8sLvnNVwJ5T+mk
	 Jx5AfMS6gK/W/oiPMJO3lOo2guVkjmug+/ktWQbMW1w7OLHarJWEzPUv/BguWdyQW4P2h
	 L8pZJCXuJuP/JEuFcGN5o/Ff4MZkMuyIe0iFE2qv68qBTSRYL45mEl2kgOeAXeAg3jA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YYuazTkN;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 895531F000FF
	for <tools@kernel.org>; Mon,  5 Oct 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YYuazTkN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 895531F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so17712675e9.0
        for <tools@kernel.org>; Mon, 05 Oct 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791203833; x=1791808633; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGlPa27UhVkYPQw5DtghAXle6iXZlIbFDHayalbnIZ4=;
        b=YYuazTkNOCrUxkotZvtCZtZTKUeu8WVx4ozwATZCIF2cPxo9NgwYs1xURSNHI2S6ZH
         EXlC8opNumk0rhzOefM4Jv+p2ACfnnkycs+V/KjyKrx1LOVaOh0fN9khsk2rATn7rTEZ
         5d6L3L8zHUuKgQ/8x9pEbOtwuVr1+zzslITcWF2PqvVE52Y281ByyLrVpdu8zp2ePA/P
         JwtlRdxuTLg7SNp5Vlo7NQ2zR4KwlzIdzJqLjiETXTQDoDhY3rbDNmZUpwPF3BZp6XRA
         8rNHz/TjjRjvwVRFKmnVnWXe2wbQGbtuEkVoLcN3C2d3ieydJGx+C/J+tg3v6aWc9s/t
         hjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203833; x=1791808633;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGlPa27UhVkYPQw5DtghAXle6iXZlIbFDHayalbnIZ4=;
        b=Ssu1hk2EzZERQwlxoFJotFeIyae2sHzRvSH6vg9KO5ELiZVuNkXombmmUiNg4e1l07
         HxZ7ft24VZ9qAWa58sqFqjFxrRu3xibPiVP6r8BMVlYZfZjyEK9Y/76zC3u82lB/C3JF
         Zq63BbT3Q5qeaILgi96mRzCtNFCMjd54FZS2PrQzfYtvjHcngCxFs9MetTBk5N5vAPI0
         oHrzlUAADTNFMYGDq1dCO6yW94D+v9VhcAn0J7Y1iUvXnjK613IvZu6CjaIT4YNeunMM
         UZ1c/IxtJVrLlvYJGU85qxbS5WozXyjQVWqs+QucgJixnJHJCgUzVRtmpaokzulhUeUr
         qOTA==
X-Gm-Message-State: AFuF++n6WJBawJrctKZGtIaTCQZSgdeRLB4jO2VIQwPniaCcYkE2av94
	ZfzY9fQ22RcwUuvCmeIw8LBIzI9sT4hpI4ZnfJmiNKdwPCqaoY5pyyO1ibKMfP3A4Fwf03oBy05
	63SBq
X-Gm-Gg: AYBFou0nRpYf2T8jhf39wHX00qGd1KVqwOX5RKZHxQTXF+1IrTx11xEJjTcASkJQI3P
	YKZZG/aUZNqX3BSNUDTqm2SZnN1OsUqkoaPwJzb56hZzICPR6mj0v6iGsOeHvdDF0srAl7iDHEi
	u93riEGkaqi7FzpecmG/Sq6IPZno+dGOtRnvbMRuieBxnuIfXl1/I4er0b65QODXt9FAroj/eUD
	e6MlmrbzwjCzqWsFeaHlyoN+PBkDLtC98N6e8mD9BREL5jQBBgcVQVe1xdKi/hyPrk3T1JiksfF
	n5F8uWNh8rh6Z1SSaQnDuQ5Cxtnwq4/H4XSYHwIvvcenVvPYRiiwPw7mZTqnq4Y0EQYLAvthfqQ
	MpphxQ2ZmVz2gL1XRRjQC0qEA1aRUXYc33qFfwh954diLhph+hG5/64dkYpuv2aMZjnFGnVNi8f
	752wbXLPDocTJBPlTbdQck9dXkporIyO1huY3i8ijd4eP5bXFjMrdBK+m83uewiIskNs5cRhM11
	59aEb+VmsZQ3sg1dMQ52XolvlRX+RJRczCJ/A==
X-Received: by 2002:a05:600c:4e53:b0:4a1:756b:e93d with SMTP id 5b1f17b1804b1-4a1756bea83mr21369155e9.7.1791203832507;
        Mon, 05 Oct 2026 05:37:12 -0700 (PDT)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6229e0d6sm3223126f8f.32.2026.10.05.05.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:37:12 -0700 (PDT)
Message-ID: <01c5b15f-7f4e-4620-be36-bddaa37255d6@baylibre.com>
Date: Mon, 5 Oct 2026 14:37:11 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH b4 3/3] lore: stop a less pager quitting on output that
 fits one screen
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20260925-b4-lore-fixes-v1-0-103fd9507e67@baylibre.com>
 <20260925-b4-lore-fixes-v1-3-103fd9507e67@baylibre.com>
 <179119498922.1802901.11622089083955121536.b4-review@b4>
Content-Language: fr, en-US, en-GB
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <179119498922.1802901.11622089083955121536.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Konstantin,

On 10/5/26 12:09 PM, Konstantin Ryabitsev wrote:
>> [ ... 32 lines skipped ... ]
>>           if '|' in pager:
>>               # Pager uses a pipeline (e.g. "diff-highlight | less -RFX"),
>>               # so we must use the shell to interpret it.  Feed data on
>>               # stdin since piped pagers read from the pipe, not from a
>> -            # file argument.
>> +            # file argument.  The less inside is out of reach, so F only
>> +            # comes off the environment here.
>> +            env = dict(os.environ)
>> +            env['LESS'] = env.get('LESS', 'FRX').replace('F', '')
>>               logger.debug('Running (shell): %s < %s', pager, temp_fpath)
>>               with open(temp_fpath, 'rb') as fh:
>>                   spop = subprocess.Popen(pager, shell=True, stdin=fh, env=env)
>>           else:
>>               sp = shlex.shlex(pager, posix=True)
>>               sp.whitespace_split = True
>> -            cmdargs = list(sp) + [temp_fpath]
>> +            cmdargs = list(sp)
>> +            if cmdargs and os.path.basename(cmdargs[0]) == 'less':
>> +                # less takes its options left to right, so -+F resets
>> +                # quit-if-one-screen whichever set it.
>> +                cmdargs.append('-+F')
>> +            cmdargs += [temp_fpath]
>>               logger.debug('Running %s', ' '.join(cmdargs))
>> -            spop = subprocess.Popen(cmdargs, env=env)
>> +            spop = subprocess.Popen(cmdargs)
> 
> Would this cause problems for people who set their less env to different
> settings? I'm not sure I'm comfortable blindly appending +F to all
> possible less invocations.

We were already removing F from environment variable before this patch 
and to me it wouldn't interfere with people settings:

 From `less --help`:
   -F  ........  --quit-if-one-screen
                   Quit if entire file fits on first screen.
 From `man less`:
The environment variable is parsed before the command line, so command 
line options override the LESS environment variable.  If an option 
appears in the LESS variable, it can be reset to its default value on 
the command line by beginning the command line option with "-+".

This let me think that we might not need the env path at all in fact...
I'll rework the whole patch.

> 
>>           spop.wait()
>>   
>>   
>> diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
>> index 601c0dc..b677b69 100644
>> --- a/src/tests/test___init__.py
>> +++ b/src/tests/test___init__.py
>> @@ -2763,3 +2763,81 @@ class TestFakeAmGitlinkPreimage:
>>               ecode, entry = b4.git_run_command(repo, ['ls-tree', commit, 'sub'])
>>               assert ecode == 0
>>               assert entry.split()[:3] == ['160000', 'commit', gitlink]
>> +
>> +
>> +class TestViewInPagerLessFlags:
>> +    """-F has to come off a "less" pager, and nothing else may change.
>> +
>> +    Output short enough to fit one screen -- a range-diff narrowed to a
>> +    single patch, say -- is exactly what quit-if-one-screen flashes past
>> +    the reader, and a core.pager of "less -FRSX" carries that flag where
>> +    the LESS environment cannot reach it.  less reads its options left to
>> +    right, so appending -+F resets it whatever spelling the pager used,
>> +    and nothing in the pager's own arguments is parsed or rewritten.
>> +    """
>> +
>> +    class _Spawned:
>> +        """Stands in for the pager process, which nobody is here to read."""
>> +
>> +        def wait(self) -> int:
>> +            return 0
>> +
>> +    @classmethod
>> +    def _spawned(cls, monkeypatch: pytest.MonkeyPatch, pager: str) -> List[str]:
>> +        """Return the argv view_in_pager() would have run."""
>> +        seen: List[Any] = list()
>> +        real_popen = b4.subprocess.Popen
> 
> This line and the monkeypatch.setattr() below fail ci.sh at the mypy
> step (mypy runs in strict mode, so implicit re-exports are off):
> 
>      src/tests/test___init__.py:2789: error: Module "b4" does not
>      explicitly export attribute "subprocess"  [attr-defined]
>      src/tests/test___init__.py:2800: error: (same)
> 
> You should just add `import subprocess` to the test imports and use
> `subprocess.Popen` / `monkeypatch.setattr(subprocess, 'Popen',
> fake_popen)`. It patches the same object, so the behaviour does not
> change.

Right I'll rework the whole patch.

Best regards,
Clément

