Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3243811E2
	for <tools@linux.kernel.org>; Sun, 13 Oct 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728811750; cv=none; b=vC+30nydPQMhI8g1ygPGFiPy1fyowaaweyt5O9z7iNZqfNfIKp0sbTlV+2GbTkR3YDoXLPuz6e9tlPMBbo4ugrfBEH3I+Prbk6fnEhWDJ75zenh/nJYG8qi08Q5CecNKe0AMT9hsiTWU344Ekw8nof5kulcTbHLXBT8CR5o0/Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728811750; c=relaxed/simple;
	bh=Yw4seZEekvQP/p/jHD5hvEqrfR2WtMc2dOGJDNAhoqY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lggnNatUPJYrlNm7G1Y3O+Eu/jXCmzygQysQYN3fOjiKxVYgYr6HUx59wp1GqPty8MG4oNdwzG6CRI3UiJs7d9yYK1f93KFM1Fshy50ClZw1sI9j5JH49fcb2zJF1YLm2w+/eEyr3OwK1a2tdrseP1ae7CKSMREmjwUvAVPDKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyXUdJOa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyXUdJOa"
Received: by smtp.kernel.org (Postfix)
	id 7C458C4CECF; Sun, 13 Oct 2024 09:29:09 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A84ADC4CEC5
	for <tools@kernel.org>; Sun, 13 Oct 2024 09:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A84ADC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6dbc5db8a31so22623277b3.1
        for <tools@kernel.org>; Sun, 13 Oct 2024 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728811747; x=1729416547; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yw4seZEekvQP/p/jHD5hvEqrfR2WtMc2dOGJDNAhoqY=;
        b=NyXUdJOaiMQxTC5nrqXRRB4EbRr9OvIQ0iYfObj7p1avCJMwFYCKO+zJKuey1fqp6Y
         24FC3B3mZ9qwk7c3WV5TwoOT/z2+CwUlXtn2ikYVCkcXFN0kqGBB6Oc8uS/0MDebHhvs
         67NaSLgsiY3NPFpQ1IUZZRnAWzIOGI28okI/G9HZBm4Z2tSJFo8FRJvMKQy9kJ2S6QV3
         msFZYzP0nN5N8USDpbL7xcdxCOsCDJ3AHbZJ8nhmaKNR0IPaC7ip8cMLmJ/2rP648wJn
         Z01Cd1+s42GeH33rl5FU+06cBiiHHZamvbs6DOavANY8f7MnnPrh/bbtLd/WQ+nWriE2
         H1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728811747; x=1729416547;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yw4seZEekvQP/p/jHD5hvEqrfR2WtMc2dOGJDNAhoqY=;
        b=uM+dgNI0BRI3rVy6m23mtfCgyGTgXLF4o96EYbLiu6XdsiXnoCV/4834sSJ7kXvVY2
         632fGLE742FAZSG1bcqnwYsYfY6ZqWbPOeHUG1MzZxxAqsbTNiRbyOuzfGDVfHtJZt4a
         FuA86qVIcJSLfWRQYWxsMBzxNguEylM9pAv2oCQQOjuz1SjYbQati3+6BHWJbHx5wNDj
         XLGHT7MUo/v8JX82zM39ktVbd5E8mWS7nJcbuapbBkudR806W+PeRnjPy5itrI6o+Ncy
         ZkMlDo0Cx7rePyx1+lhTfpkEetjMmhZ98+TFZZlKWczgzvDhbW6NJ4xY3YYuw4zu06LV
         LC+A==
X-Gm-Message-State: AOJu0Yy6sChDUwPlbDU42UcsXRz0UoK1FlH4xwoWOj6biNm0fG6RHpOK
	F8wTYzAD4Fyta+CNpgGI1EJeBE0aM8OPRCzmbY5LTQrY8HKcRktJK5MXI2zDvEWXaIcecr4KJZS
	ygAkQ5Bv8jvz0sdI2GnKokY8EJydgbCDgwOM=
X-Google-Smtp-Source: AGHT+IF2mtAT/zqubJzdWN5zKjIMcMkAwOsRskMdT3Sr1dPOE9uw49L/uGdqmKfJD8ON8F1QoogSvenr7sIjS8gP76M=
X-Received: by 2002:a05:690c:668c:b0:6e2:a250:a1bc with SMTP id
 00721157ae682-6e32f29e5b3mr80584767b3.22.1728811747646; Sun, 13 Oct 2024
 02:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Sun, 13 Oct 2024 11:28:56 +0200
Message-ID: <CAOiHx=nHXJLVM2ZfDGEi+VDYPhVuoZdpYhLTQwAGLgUiVmZvpw@mail.gmail.com>
Subject: b4: adding/updating individual patch changelogs?
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

is there a way to add/update changelogs to each patch of a series?
prep does it automatically for the cover letter, but I find no option
for the individual commits themselves, or it even mentioned in the
docs. Ideally something where b4 automatically updates the changelog
(templates), but I'll take anything that does not require manually
editing the generated patches themselves every time.

Best regards,
Jonas
