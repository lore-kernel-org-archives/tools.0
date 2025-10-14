Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97E1DE4CA
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760405375; cv=none; b=Yd4J72X2NGLjyNp8WKcLQHUgZU+W+hoZ0g3kuN9yAN31tJp3G3CANB7U3kvm6MI5MWQPF3xsmAUdzKW647Qp9HjGakcsE10az74CyusXjBWpSbfRY4XwTVsAN3k/s0jo1Bjbg1/5IbbyUSPCq9G/s8Dv8r+yhHsVlSHuD83BIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760405375; c=relaxed/simple;
	bh=si4OML94z40OXb36vBCBxxUcnDTFYdwWZPlcxbnCrNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqpl+uuIbM4NpTVw/eYQTq9oFaSGhISc0AG+DjIO0s76f3Wm7ZmKrAMVyyw2WGHwk/DY1qmpSo5GS6R5n4KmAsE/Y8MqbH4Bd9/odf/BqxyrZLZlFIZsHTLXtUBPI3D71k8sAO4h+HaAxxxNTO8eii4/MAO+whBwhut2rCpbZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AlEIWSG9; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AlEIWSG9"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so687245466b.2
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 18:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760405371; x=1761010171; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0bukPd6WyA4bci6El0/N175gVioDdRpxHIUg1HbgwfE=;
        b=AlEIWSG9bfU9yOc5yMGUkQyzyKuBnmuHJzffNx1TxC1Il8CmXnk3oBpMGYACWIjNqt
         nYazltBZfDfjfcv95OnimdY3ArzHTqGYUfOpIeK+4Ri0Hgg/St/+zIh3VWQ4aU2MnMuf
         +gNWQEpAPgvt/Odo0NYmvttZARKEUnMDOPS0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760405371; x=1761010171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bukPd6WyA4bci6El0/N175gVioDdRpxHIUg1HbgwfE=;
        b=sicaLdcYSCvbMWoQNpLIOvL96q9ov6oNEjd28lRBjqm9VRx0ifNB2jYARhp/PycHOc
         AjAbV6Yj0uDE65FV8NbAMsWz0wUrfWAK5G/0smoeza19gpci4P7vZnfLLQZHluKak2Jq
         +qbwbrYNmdFiOkEnbRdeAg4f5+o91rYA7u7M1O5HlibN8vnQKY5l7C1m8Eabdft2A7aN
         lP52GE7nhjh4PIT258y5YT53S5nHm7C25YK1LfzjNTWQd5vuoYR/T1izMnd77rmESiWD
         bvsJ09oA/AMr/QhgmPXvDjwqdZmNDLzuYP+hNwMrwpOUsxXKxAzZSScodBk0LBU/ik9t
         KpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkUJ/JtutqUXcB7w0l1WzQiGBbieINEZ63PmmDLBb4nhdYW5RBj2n3FAn36Mu15x8KVAcIYg==@linux.kernel.org
X-Gm-Message-State: AOJu0YwgqX2kJ6RuAxkKZo+m3+vOK1Oen3N0f0mvnFnJ8RfJJgp8mGUv
	JAn9FxymNRinlbD/ZlNF4Y3Y5JHT0vODsXq1D2fpDuOSWVC2l6ZpgwUYrc6sSe8xGwkz76U+LhM
	za53tDBk=
X-Gm-Gg: ASbGncs1J0i1WeDK4L0LwAbH1pJxxowysKFaaF7YhnlK+8RFPvEBgG9ZVU6LNUqg6Al
	OVxrB0t0iw+YDu+1WtaFSGJFyw9sAcmvAakKQuWUPks9SIB11wKzoVRQ1bslj58vr8PZh4p8SEM
	oYX3sBNcjvrllyw3uyWIimThKP9efTpxw1I2r5BNhWYL3d6yy2xL0v3+VUMUjjWkC1+yfLCMf69
	GQMInLAZuWr0ipBtfvR7kWWK9PMhJ3sN9DTlLDDP4Lqww7s+e91NGYz71+fE4cuc582Rfm2z3cA
	FOlgubew5HjIgQ6aZemyhIzLsIaE/GJvR38pUc0VnClE+c1v4p0mcwBRlTLoVHXABEC3XYUZSV1
	/8yfe/4P4d6kl4GyePdN0e1bHttwcjeDH/k48ukleWHDD740OZl9Bwx7iAx3P9arEWTMMbV/pGv
	VYnyNT0mzeUXmNSQ==
X-Google-Smtp-Source: AGHT+IHzs4YRaJtfU7SQ2V7AVymfL/fxEf4CgdiE8pyhyyLI6k7tIBZ3e/vnOMWp0nfXzp6sgXoh2Q==
X-Received: by 2002:a17:906:6a25:b0:b2c:dc13:89e3 with SMTP id a640c23a62f3a-b50acc32fd2mr2540030466b.59.1760405370806;
        Mon, 13 Oct 2025 18:29:30 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d66cc4b8sm1048173866b.30.2025.10.13.18.29.29
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 18:29:29 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63babfdb52cso2505315a12.3
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 18:29:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQuKJX5XPfg3k6p7PE5FS8BWQJo0B3X3dlcqJNIqiJ6Vatmf5kwh+zEDA6eflXUCufC3Yekg==@linux.kernel.org
X-Received: by 2002:a05:6402:354c:b0:639:fb11:9938 with SMTP id
 4fb4d7f45d1cf-639fb119beemr14815860a12.17.1760405369437; Mon, 13 Oct 2025
 18:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
 <xmqqy0pezhm7.fsf@gitster.g> <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
 <aO2JoWLd0Mxc4oUV@laps>
In-Reply-To: <aO2JoWLd0Mxc4oUV@laps>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 13 Oct 2025 18:29:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh1xgRtj4=sCUfFnd4ZG5pC3hGX2dS6-Sejrca8vP_RsQ@mail.gmail.com>
X-Gm-Features: AS18NWCrVetfw-jELIZ1JIpJ39kNWqg26kHIrw-aa23PRrx32nS_XUpRbWq_8vM
Message-ID: <CAHk-=wh1xgRtj4=sCUfFnd4ZG5pC3hGX2dS6-Sejrca8vP_RsQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Sasha Levin <sashal@kernel.org>
Cc: Junio C Hamano <junio@pobox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Oct 2025 at 16:22, Sasha Levin <sashal@kernel.org> wrote:
>
> If you want to use it as part of your git-rebase workflow, just call the script during rebase:

Yeah, I've used 'exec' tricks too, but not for this particular case,
and I do think your script is particularly hacky.

IOW, having an interactive rebase thing like this:

>    pick c3c4268124d22 # kbuild: Use '--strip-unneeded-symbol' for removing module device table symbols
>    pick 4ee16af35eb65 # tracing: Fix tracing_mark_raw_write() to use buf and not ubuf
>    pick 88d5c7c180dfc # tracing: Stop fortify-string from warning in tracing_mark_raw_write()
>    x stable-make-triangle 2

certainly "works", but doesn't strike me as a particularly good way to
sayt "group those two last things into one 'merge group'".

This is something git rebase probably _could_ have some nicer active
support for.

At a minimum, I'd say that the rebase scripting should have something
where you can delineate the start/end points in a legible manner.

But I do find it interesting that you actually do already use that
workflow I outlined, and I do think it's worth looking into, I just
think your particular 'stable-make-triangle' script is a bit _too_
esoteric as an interface ;)

           Linus
