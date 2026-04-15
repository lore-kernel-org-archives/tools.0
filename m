Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65303233F4
	for <tools@linux.kernel.org>; Wed, 15 Apr 2026 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246734; cv=pass; b=YL5G5pgKlxgMiGYYe1157NMirYT3PIX/wPl0kZPUtypfvyHtS64JJNIFl6OoEhtzbH/NLdOvJoBObxzsruLjOVYw3diG1ocFoM22lzrHaRxMfbhCF4niWmiDvFyUINOL841jkw30ezawg/+KxndwzUU04DmJWeothyiZOWcWD0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246734; c=relaxed/simple;
	bh=NnnHpn7vGKQ1Obp07ck6iCg+0cu77d2ZtjafmyWgkX8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LkgfcDIWFK0eMejSIKfg/ZZeBuAUviiEXmJNxaf/hlLnuaBsT9rZpJPthCP1ztr7lOz3w/CPWFufUSsT6ffRz3RYuhYIKsZna0t+4S0eEwULXd0UIK8YK3pyNgjvKBkxfmbdwLAJtVFhgWnm9S5fdMe96VCYmwcWfacp5ByPYzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gCCCSWY/; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gCCCSWY/"
Received: by smtp.kernel.org (Postfix)
	id 57425C2BCB7; Wed, 15 Apr 2026 09:52:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0A17C19424
	for <tools@kernel.org>; Wed, 15 Apr 2026 09:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0A17C19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so80545415e9.0
        for <tools@kernel.org>; Wed, 15 Apr 2026 02:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776246731; cv=none;
        d=google.com; s=arc-20240605;
        b=EH1VbD+pyIDXKcrYz6D5n7xGAAAvuHvtrOoGPcGr/RHxrVn8LFQij4con1YDZNEVDt
         JX3JHBbvJFCljE2xt7Q28o17cK1Z/7G3vAjs9i7yoDa2lQWCBWpksGyM5keBTZvqSOPn
         4158GST5DGO8nYQKvOdWiKYr+BfaO3FbH/wqPmJCaDKEzMZ8ZITk7neMS/NtTCMJ/3Nl
         969E2uQv4XVBU/kygXkT/l0okE5TW7xPWFAK7PuvHWq+2HtrqyZ7XAdzcC2Gd0mR17HO
         aeLAvkfFWrhhHYm6a1HaIzAGoZZ+uD0N9qpwOwwGVGvOcU82SB7N3LRAXSxtsqi1ve92
         BatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NnnHpn7vGKQ1Obp07ck6iCg+0cu77d2ZtjafmyWgkX8=;
        fh=hEAhbY4Z4VJioW+1JHx+fHJtlsKxnPuHOkoU5UdidNA=;
        b=h8v0shXQjn7Nxc/eNbo0rTkB3Siab6LgRgRLhkwKd6+m0FJ6/UBNhI3Ew5kn8YHcpi
         RJyI57RYrpgtQjUlACj0nqlYjUzMMo6/NtKADSsltKFEuQ26C+6m0WkQ6Qo9Cyv9ckh+
         XGuK4aoAB3yj4qiYeCfM7EpaE++Wd9nvDEhrd+AkvPjqJ7iClqbexJkGAzIAkd7GAY4Q
         9pcmm8MqmG7v0bkVo3ZPhfjKRJjwsnGmJbp2SOOW0l3Jzzuj6Mh0mqYuhXc45ZstvyL6
         XgaVl+y733E5ENlNFY10RwKFDwMdCrKjvEVgw2x8z7RIu/Faj6NbeT+h80tA3di64uIc
         8K3w==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776246731; x=1776851531; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NnnHpn7vGKQ1Obp07ck6iCg+0cu77d2ZtjafmyWgkX8=;
        b=gCCCSWY/UtnIHTDHx9DQU9ne3hnUKlyLnzERBPITM5fKuUFccCNn4AXozv3S7v3L4H
         moMkfbE7QQ6mXIUAqDuBr1Mvfw87hp9JEP3Lby2A/sfWHwxtQ7AmX4iaKuzzjF0IEXbw
         nqj9ANA3GxUhQb31SGZejZHd5u4ddYXpHrr1VPEf5jIrFnF489m2iysNogyOtyaUsXLn
         vqGwzXJUZ0oXTv+gLj64xYBstXXxOE4/kkys+iBzIAhKdutPSWYovlWOQ3Sk7DjTSfpx
         sXI3oZUDAq3JVtZcMq7Z7d09KGqFDzQsTTiUM2BVjkwINkCLBUE13Tkhsh/t892/uHxm
         Fdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246731; x=1776851531;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnnHpn7vGKQ1Obp07ck6iCg+0cu77d2ZtjafmyWgkX8=;
        b=NLe5Y8noKZgFyHY9e92V+zlCrPSXEMI75lTHOvP2BwHmJ5NMELIQ/B/oHQh9aJStSg
         TxFNWsEojBfs9D9/S0QW+GdwhqpaXZBpfvqfvrEH5oUHkUjBn3gUCEkzI4SZIz+pmNKS
         vJ5IA/PhzixxUD3ZerebXXK81C3H2ZrD3TvaanLjJSURo5trR1Nx3MNjR4lRkWfsbE5F
         vfX7X0RLr9o6ebJNhrb1PD4LMqtJODYvZYEOtdOGkkTyFvj1l+kJUivsFnThjjC4tQKX
         2SMxXR5wKZUN+CxXNzHn2ALoce6MvP0GUbgt0GNdMI9f/9lBgTw0LxQ9gs2RXl73lKAo
         QUdA==
X-Gm-Message-State: AOJu0YycTx5JU13Qe5i4+uvLUVGAUC4WHckj3IFPk9ecvLW2iLeyFcKb
	+Iz6lbi6mCtJNm+R8Pr6GQH8BBEHhogIL0b5vKWEIo8k+ODNPda03jR4YIyw47BrDsQ2zFjbETz
	T4+HNw0AEVtn+Lv7YMYLw1mdaNuic94FwMcDHsoNofpqTC53O8Pv03dCmd0k=
X-Gm-Gg: AeBDievStLjQwwzQu8jnLCvqSrNQFLqNil2WzLv2lqAmwTKR3sZwro+gPdN+J0zoVeP
	igRr/Ct1F3okmL6oJsECl3d5bVAEsojkQuHCaMaEWRggY+5HIo4GeuZcmqP+41YUZ9dIOAtidzO
	DunOf/WRNuBdSamiFLPJkSCD1XqbK+coFXcbAOQp22X0GvO2TJ3ZCi8EVz5oo5towtNPeaT+u8z
	UcL6ooZ+LWCDKtlKsZVBAvQY9JsbKOQ9Zb/1bfpdY0p3tH6Xhh9QnPSFgzZulE8z0drsqijEgqv
	d4TLDGjnwqQ2s6b8B7lZUvUe0F75Vkk2aK/thGq8kmxUopG9fc/XPn/7GfE=
X-Received: by 2002:a05:600c:a109:b0:488:b187:3c with SMTP id
 5b1f17b1804b1-488d68431ebmr207820305e9.14.1776246730840; Wed, 15 Apr 2026
 02:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Apr 2026 11:51:56 +0200
X-Gm-Features: AQROBzCj0uHOJ5HADejy6UsBrBggl8JuF3JfVsZMPMAqGugIwx9HV_W1qjXNhp0
Message-ID: <CAH5fLghw=fjJoWe3pt0QWVKpYXc_SzKmhYZdapkfWBOD9=1+rQ@mail.gmail.com>
Subject: Overriding editor with b4 prep --edit-cover
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

I want to invoke b4 prep --edit-cover with a different editor than the
one configured by default for automation purposes. I tried various
things such as changing configuration variables EDITOR, GIT_EDITOR,
etc. I also tried

b4 prep --config core.editor=<cmd> --edit-cover

However, no matter what I tried, b4 just opens up NVIM as is
configured in .gitconfig.

Is there a way to override the editor?

Alice
